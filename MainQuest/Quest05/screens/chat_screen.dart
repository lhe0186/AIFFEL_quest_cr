import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../services/chat_service.dart';
import '../services/summary_service.dart';
import '../services/diary_service.dart'; // Hive 저장 기능 추가
import 'diary_list_screen.dart';
import 'diary_screen.dart';  // 요약 화면 추가!

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final List<String> _conversation = [];  //대화 내용 저장 리스트
  final types.User _user = types.User(id: 'user');
  final types.User _ai = types.User(id: 'ai');
  final ChatService _chatService = ChatService();
  final SummaryService _summaryService = SummaryService(); //요약 서비스 추가
  final DiaryService _diaryService = DiaryService(); // Hive 서비스 추가

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      id: const Uuid().v4(),
      text: message.text,
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, textMessage);
      _conversation.add("나: ${message.text}"); //대화 저장
    });

    _sendAIResponse(message.text);
  }

  void _sendAIResponse(String userMessage) async {
    final aiResponseText = await _chatService.getChatResponse(userMessage);

    final aiResponse = types.TextMessage(
      id: const Uuid().v4(),
      text: aiResponseText,
      author: _ai,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, aiResponse);
      _conversation.add("AI: ${aiResponseText}"); //AI 응답 저장
    });
  }

  void _summarizeChat() async {
    final summary = await _summaryService.summarizeChat(_conversation);

    // 현재 날짜 가져오기
    String today = DateFormat("yyyy-MM-dd").format(DateTime.now());

    // 일기 저장
    _diaryService.saveDiary(today, summary);

    // 요약된 일기 화면으로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiaryScreen(summary: summary), //요약 화면으로 이동
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("해삐와의 톡방"), backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.book),
            onPressed: _summarizeChat, //요약 버튼 추가
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiaryListScreen(), // 일기 목록 화면으로 이동
                ),
              );
            },
          ),
        ],
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }
}
