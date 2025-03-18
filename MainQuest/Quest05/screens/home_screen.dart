import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("홈"), backgroundColor: Colors.lightBlueAccent),
      body: Stack(
        children: [
    //   //배경 이미지 추가
    //   Positioned.fill(
    //   child: Image.asset(
    //     "assets/images/icon/background.jpeg", // 배경 이미지 추가
    //     fit: BoxFit.cover,
    //   ),
    // ),
    Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        child: Text(
          "해삐와 대화 시작",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ),
        ],
      ),
    );
  }
}
