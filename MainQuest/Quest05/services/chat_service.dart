import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatService {
  final String apiKey = dotenv.env['OPENAI_API_KEY'] ?? ''; // .env에서 가져옴

  Future<String> getChatResponse(String message) async {
    final url = Uri.parse("https://api.openai.com/v1/chat/completions");

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: utf8.encode(jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "너는 친절한 친구다. 너의 이름은 '해삐'다. 말은 반말로 하도록 해. 너무 적극적으로 오늘 행복한지 힘든지 처음부터 물어볼 필요없고 친구의 반응을 보면서 대답해. 너는 친구가 힘들 때는 위로해주고, 기쁜 일이 있으면 같이 기뻐하고 축하해주고, 슬픈 일이 있으면 같이 슬퍼하며 응원하는 말을 해줄 수 있는 친구다."},
          // todo: 나중에 한국어로 설정을 다시 만져보기.
          {"role": "user", "content": message}
        ]
      })),
    );

    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      String decodedBody = utf8.decode(response.bodyBytes);
      final data = jsonDecode(decodedBody);

      return data["choices"][0]["message"]["content"];
    } else {
      throw Exception("Failed to get AI response");
    }
  }
}
