import 'package:flutter/material.dart';

void main() {
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
  int _selectedIndex = 0;

  // 네비게이션 바에서 선택된 화면을 나타냄
  final List<Widget> _screens = [
    HomeScreen(),
    FreeTalkScreen(),
    ReviewScreen(),
    ChallengeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 아이콘 크기 유지
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "프리톡"),
          BottomNavigationBarItem(icon: Icon(Icons.reviews), label: "리뷰"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "챌린지"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "프로필"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("✔ 홈"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("코스"),
                ),
                Icon(Icons.local_fire_department, color: Colors.orange),
                Text("0", style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(top: 80, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("오늘의 수업 주제는 ...", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.purple,
                    padding: EdgeInsets.all(50),
                    child: Column(
                      children: [
                        Text("That's _______.", style: TextStyle(color: Colors.white)),
                        Text("Let's eat ______!", style: TextStyle(color: Colors.white)),
                        Text("I'm ______________.", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FreeTalkScreen()),
                      );
                    },
                    child: Text("시작하기"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FreeTalkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("홈")),
              ElevatedButton(onPressed: () {}, child: Text("✔ 코스")),
              Icon(Icons.local_fire_department, color: Colors.orange),
              Text("0", style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 20),
          buildMessageTile("A", "완전 오랜만!", "It's been a while!"),
          buildMessageTile("B", "저기 나 쇼핑 갈까 하는데", "So I'm thinking of going shopping."),
          buildMessageTile("C", "시간 되면 영화나 볼까?", "If you're free, do you want to see a movie?"),
          buildMessageTile("D", "좀 이따가 알려줘도 돼?", "Can I get back to you later today?"),
        ],
      ),
    );
  }

  Widget buildMessageTile(String letter, String korean, String english) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$letter  $korean", style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 4),
          Text("$english", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}


class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Text("리뷰 화면", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}


class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Text("챌린지 화면", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Text("프로필 화면", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
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
//       home: MainScreen(),
//     );
//   }
// }
//
// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   bool _isHomeSelected = true;
//
//   final List<Widget> _pages = [
//     HomeScreen(),
//     FreeTalkScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   void _toggleTopBar() {
//     setState(() {
//       _isHomeSelected = !_isHomeSelected;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _isHomeSelected ? _pages[_selectedIndex] : CourseScreen(),
//           Positioned(
//             top: 30,
//             left: 16,
//             right: 16,
//             child: _buildTopBar(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: "프리톡"),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
//
//   Widget _buildTopBar() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.black87,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildTopBarButton("홈", _isHomeSelected, () {
//             setState(() {
//               _isHomeSelected = true;
//             });
//           }),
//           _buildTopBarButton("코스", !_isHomeSelected, () {
//             setState(() {
//               _isHomeSelected = false;
//             });
//           }),
//           Row(
//             children: [
//               Icon(Icons.local_fire_department, color: Colors.orange),
//               SizedBox(width: 5),
//               Text("0", style: TextStyle(color: Colors.white)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTopBarButton(String title, bool isSelected, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue : Colors.transparent,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       body: Padding(
//         padding: EdgeInsets.only(top: 80, left: 16, right: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("수업 바로가기", style: TextStyle(color: Colors.white, fontSize: 20)),
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   Text("오늘의 수업 주제는 ...", style: TextStyle(color: Colors.white)),
//                   SizedBox(height: 10),
//                   Container(
//                     color: Colors.purple,
//                     padding: EdgeInsets.all(16),
//                     child: Column(
//                       children: [
//                         Text("That's _______.", style: TextStyle(color: Colors.white)),
//                         Text("Let's eat ______!", style: TextStyle(color: Colors.white)),
//                         Text("I'm ______________.", style: TextStyle(color: Colors.white)),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text("시작하기"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class CourseScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 80, left: 16, right: 16),
//           child: Column(
//             children: List.generate(10, (index) {
//               return Container(
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[800],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text("코스 내용 ${index + 1}", style: TextStyle(color: Colors.white)),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class FreeTalkScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 80, left: 16, right: 16),
//           child: Column(
//             children: List.generate(6, (index) {
//               return Container(
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[800],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text("프리톡 메시지 ${index + 1}", style: TextStyle(color: Colors.white)),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }
//


