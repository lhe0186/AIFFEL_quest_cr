import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("캘린더"), backgroundColor: Colors.lightBlueAccent),
      body: Center(child: Text("캘린더에서 일기를 확인할 수 있다...")),
    );
  }
}
