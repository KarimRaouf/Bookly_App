import 'package:bookly_application_course/features/out_of_scope_app/deep_speech.dart';
import 'package:bookly_application_course/features/out_of_scope_app/voice_record.dart';
import 'package:flutter/material.dart';

import '../../test_code.dart';

class FeaturesOutOfScopeScreen extends StatefulWidget {
  const FeaturesOutOfScopeScreen({super.key});

  @override
  State<FeaturesOutOfScopeScreen> createState() => _FeaturesOutOfScopeScreenState();
}

class _FeaturesOutOfScopeScreenState extends State<FeaturesOutOfScopeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Deep(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.tealAccent,
                  ),
                  child: const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Deep Speech',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'GT Sectra Fine',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VoiceRecording(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.tealAccent,
                  ),
                  child: const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Voice Recording',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'GT Sectra Fine',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

