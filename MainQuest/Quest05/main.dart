// import 'package:flutter/material.dart';
// import 'screens/chat_screen.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ChatScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_lab/main_quest/screens/diary_list_screen.dart';
import 'package:flutter_lab/pair_progranming_quest/quest_04_0310.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'screens/chat_screen.dart';
import 'package:flutter_lab/main_quest/models/diary_entry.dart'; // Hive 모델 추가
import 'package:flutter_lab/main_quest/screens/home_screen.dart';
import 'screens/diary_list_screen.dart';
import 'package:flutter_lab/main_quest/screens/calendar_screen.dart';
import 'package:flutter_lab/main_quest/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 비동기 초기화 허용

  // Hive 초기화
  await Hive.initFlutter();
  // 모델 어댑터 등록
  Hive.registerAdapter(DiaryEntryAdapter());
  // Hive Box 열기
  await Hive.openBox<DiaryEntry>('diaryBox'); 
  
  await dotenv.load(); // .env 파일 로드할 때 경로 확인; // .env 파일 로드
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // ✅ 현재 선택된 페이지 (홈 = 0)

  // ✅ 페이지 목록
  final List<Widget> _pages = [
    HomeScreen(),       // 홈 화면
    DiaryListScreen(),  // 일기 리스트 화면
    CalendarScreen(),   // 캘린더 화면 (현재 빈 화면)
    ProfileScreen(),    // 프로필 화면 (현재 빈 화면)
  ];

  // ✅ 네비게이션 바 클릭 시 호출
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // 현재 선택된 페이지 표시
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "일기 리스트"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "캘린더"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "프로필"),
        ],
      ),
    );
  }
}