import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_deep_speech/flutter_deep_speech.dart';
import 'package:record/record.dart';

class VoiceRecording extends StatefulWidget {
  const VoiceRecording({Key? key}) : super(key: key);

  @override
  State<VoiceRecording> createState() => _VoiceRecordingState();
}

class _VoiceRecordingState extends State<VoiceRecording> {
  String path = '';
  final record = AudioRecorder();
  bool isRecording = false;

  final FlutterDeepSpeech deepSpeech = FlutterDeepSpeech();

  String text = 'Press and hold to start listening. Let go to stop.';

  @override
  void initState() {
    super.initState();
    createNewDirectory(
      directoryName: "myRecords",
      fileName: 'record2',
    );
  }

  @override
  void dispose() {
    deepSpeech.dispose();
    super.dispose();
  }

  Future<String> createNewDirectory(
      {required String directoryName, required String fileName}) async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();

    Directory directory = Directory(
      '${appDocumentsDirectory.path}/$directoryName',
    );

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    String filePath = '${directory.path}/$fileName';

    print(filePath);
    path = filePath;
    return filePath;
  }



  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      await record.start(const RecordConfig(), path: path);
      setState(() => isRecording = true);
    }
  }

  Future<void> stopRecording() async {
    final path = await record.stop();
    setState(() => isRecording = false);
    // Use the file at 'path' as needed
  }

  @override
  Widget build(BuildContext context) {
    if(!isRecording){
      AudioPlayer().play(DeviceFileSource(path));

    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Voice Recording',
          style: TextStyle(fontSize: 18,fontFamily: 'GT Sectra Fine'),
        ),
      ),
      body: Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              const Spacer(),
              Listener(
                onPointerUp: (_) {
                  stopRecording();
                },
                onPointerDown: (_) {
                  startRecording();
                },
                onPointerCancel: (_) {
                  stopRecording();
                },
                child: Container(
                  width: 300.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: isRecording ? Colors.red : Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        isRecording ? 'STOP' : 'START',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}

