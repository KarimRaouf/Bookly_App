import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/utils/strings.dart';

class OpenAISercive {
  Future<String> isArtPromptAPI(String prompt) async {
    try {
      var res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $chatGPTKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'user',
              'content':
                  '$prompt',
            },
          ],
        }),

      );

      print(res.body);
      if(res.statusCode == 200){
       response = jsonDecode(res.body)['choices'][0]['message']['content'];
        print('yeh');
      }
    } catch (error) {
      print(error.toString());
    }

    return "AI";

  }

  Future<String> chatGPTAPI(String prompt) async {
    return 'Chat';
  }

  Future<String> dallEAPI(String prompt) async {
    return 'Dall';
  }
}
