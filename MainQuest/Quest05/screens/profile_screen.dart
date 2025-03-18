import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("프로필"), backgroundColor: Colors.lightBlueAccent),
      body: Center(child: Text("일기니까 보안문제...")),
    );
  }
}
