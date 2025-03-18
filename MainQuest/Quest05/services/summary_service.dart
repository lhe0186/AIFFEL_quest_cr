import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class SummaryService {
  final String apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';

  Future<String> summarizeChat(List<String> conversation) async {
    final url = Uri.parse("https://api.openai.com/v1/chat/completions");

    String today = DateFormat("yyyy년 M월 d일").format(DateTime.now());

    print("요약 요청 시작...");

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json; charset=UTF-8" // UTF-8 설정 추가.
      },
      body: utf8.encode(jsonEncode({  // 보내는 정보를 다시 묶어서 utf8로 인코딩 시키기.
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content": "오늘 날짜는 $today이다. 일기에서 항상 날짜를 표시하도록 해. 너의 이름은 '해삐'다. 다음 대화를 일기 형식으로 요약해줘. 일기는 제1인칭 시점에서 작성하고, 일기의 길이는 150자 이내로 해야한다. 너는 AI가 아니라 '해삐'다. "
            // todo: 디테일하게 수정 필요.
          },
          {
            "role": "user",
            "content": conversation.join("\n")
          }
        ]
      })),
    );

    print("API 응답 코드: ${response.statusCode}");

    String decodeBody = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200) {

      final data = jsonDecode(decodeBody);
      String summary = data["choices"][0]["message"]["content"];
      return summary;
    } else {
      print("요약 실패! 응답 코드: ${response.statusCode}");
      throw Exception("Failed to summarize chat");
    }
  }
}
