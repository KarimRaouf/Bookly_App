import 'package:bookly_application_course/core/utils/strings.dart';
import 'package:bookly_application_course/features/out_of_scope_app/chat_GPT/record_screen.dart';
import 'package:bookly_application_course/features/out_of_scope_app/open_ai_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../generated/assets.dart';

class ChatGPT extends StatefulWidget {
  ChatGPT({Key? key}) : super(key: key);

  @override
  _ChatGPTState createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  OpenAISercive openAISercive = OpenAISercive();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  Future<void> _startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult,
        pauseFor: const Duration(minutes: 2),
        listenFor: const Duration(minutes: 2));
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> _stopListening() async {
    await _speechToText.stop();
    // openAISercive.isArtPromptAPI(_lastWords);
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(
      () {
        _lastWords = result.recognizedWords;
        print(result.finalResult);
        print('result.finalResult');
        if (result.finalResult) {
          openAISercive.isArtPromptAPI(_lastWords).then((value) {
            FlutterTts().speak(response);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Start Recording Your Voice',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),

              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                    // If listening is active show the recognized words
                    '$_lastWords'
                    // If listening isn't active but could be tell the user
                    // how to start it, otherwise indicate that speech
                    // recognition is not yet ready or not supported on
                    // the target device

                    ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RecordView()));
                },
                child: Center(
                  child: Container(
                    child: SvgPicture.asset(Assets.imagesMich),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _speechToText.isNotListening ? _startListening() : _stopListening();
      //     print(_lastWords);
      //
      //     if (_speechToText.isListening) {}
      //   },
      //   // If not yet listening for speech start, otherwise stop
      //
      //   // If not yet listening for speech start, otherwise stop,
      //   tooltip: 'Listen',
      //   child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      // ),
    );
  }
}
