// 1. 앱바 좌측 상단에 아이콘 추가.
// 2. 앱바 중앙에 텍스트 추가.
// 3. 컬러는 블루.
// 4. 화면 중앙에 버튼 추가하고, 버튼 클릭시 문장이 출력됨.
// 5. 화면 하단 중앙에 5개의 컨테이너가 큰 것을 기준으로 좌상측 정렬.
// - 모양: 정사각형, 각각의 컨테이너의 변의 길이 60씩 증가함. 젤 큰거는 300x300.

import 'package:flutter/material.dart';

// StatelessWidget 설정 : 앱의 기본 구조 구성
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug 배너 일단 비활성화.
      home: Scaffold(
        appBar: AppBar( // 앱바 설정하기.
          title: Text("플러터 앱 만들기"),
          backgroundColor: Colors.blue,
          leading: Icon(Icons.home),
        ),

        body: Column( // 메인 화면에 버튼을 가운데 정렬해서 추가하기.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        // 엘리베티드버튼 기본 값으로 타원형 버튼으로 설정되어 있음.
        // 사각형으로 바꾸고 싶으면 'style: ButtonStyle()'로 가능함.
            ElevatedButton(
              onPressed: () { // 클릭시 문장 출력하기.
                print("버튼을 클릭했습니다!");
              },
              child: Text('Click Me'),
            ),
        // 순서대로 넣었더니 역으로된 무지개가 나온다...
            // SizedBox(height: 50),
            // Center(
            //   child: Container(
            //     width: 300,
            //     height: 300,
            //     color: Colors.red[900],
            //   child: Stack(
            //     alignment: Alignment.topLeft,
            //     children: [
            //       Container(
            //         width: 240,
            //         height: 240,
            //         color: Colors.orange[700],
            //       ),
            //       Container(
            //         width: 180,
            //         height: 180,
            //         color: Colors.yellow[500],
            //       ),
            //       Container(
            //         width: 120,
            //         height: 120,
            //         color: Colors.green[300],
            //       ),
            //       Container(
            //         width: 60,
            //         height: 60,
            //         color: Colors.blue[100],
            //       ),
        // 버튼과 컨테이너 사이의 공백 설정.
            SizedBox(height: 75),
        // 5개의 컨테이너 크기별로 설정.
            Center(
              child: Container(
                width: 300,
                height: 300,
                color: Colors.cyan,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 240,
                      height: 240,
                      color: Colors.greenAccent,
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      color: Colors.amberAccent,
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.orangeAccent,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.redAccent,
                    ),
                ],
              ),
            ),
          ),
        ],
      )
    ),
    );
  }
}

// 앱 메인 실행하기.
void main() => runApp(MyApp());

// 회고:
// 책의 내용에 대해서 아직 익숙하지 못했고, 많은 내용이 아직 '본적이 있다'의 단계에만 머물러 있다는 사실을 다시 알게 되었다.
// 플러터 기초 부분을 복습하는 데에 시간을 좀 투자해야겠다.