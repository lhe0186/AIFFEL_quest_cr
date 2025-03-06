//1. 총 두 패이지로 이루어져 있다.
//2. 첫 페이지 : 앱바 좌측 상단에 아이콘 추가, 앱바 중앙에 텍스트 추가,
// 화면 중앙에 button을 추가, 화면 가운데 고양이 이미지 300*300 출력,
//3. 버튼을 클릭 : is_cat을 false로 초기화, 변수 is_cat은 다음 페이지로 전달됨.
//4. 이미지를 누르면 is_cat의 현재 상태가 콘솔창에 출력된다.

//5. 페이지2에서 화면 중앙에 'back'버튼을 추가:
// 버튼 클릭 시: 생성했던 페이지 stack을 전달한다.
// is_cat을 true로 전달.
//6. 화면에 300*300 강아지 이미지 출력된다.
//이미지를 누르면 is_cat의 현재 상태가 콘솔창에 출력된다.

//화면 전환 관련 내용: 339~379p.
import 'package:flutter/material.dart';
import 'package:flutter_lab/Chapter_test/0305/250305_3_1.dart';
import 'package:flutter_lab/Chapter_test/ch14_1_navigation/one_screen.dart';

// 기본 구성 : main 함수 + 클래스 MyApp
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Navigator Test',
      home: FirstPage(), // firstPage를 홈화면으로 설정.
    );
  }
}


class FirstPage extends StatelessWidget {
  bool is_cat = true; // 전달할 정보를 클래스 바로 아래에서 설정.

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(  // 여기부터 본격적인 화면 구성 설정.
      appBar: AppBar( // 앱바 설정하기.
        title: Text('First Page'),
        leading: Icon(Icons.cruelty_free),
      ),
      body: Center(  // 보일 기본 화면 설정하기.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  // 화면에 Next 버튼 추가하기.
            ElevatedButton(onPressed: () async {
              // 페이지 이동할 때 is_cat 값 전달.
              final result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage(is_cat: false),
                  ),
              );

              // SecondPage에서 받아온 데이터를 적용
              if (result != null) {
                  is_cat = result;
              }
            }, child: Text('Next!'),),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                print('is_cat : $is_cat'); //콘솔창 출력.
              },
              // 온라인 이미지를 바로 사용하고 싶었는데, 왠지 모르게 사용이 안됨... -> 결국 이미지를 다운 받아서 불러오게 됨.
              //Image(image: NetworkImage( 이걸로 바꿔 사용해보기! 도전!
              // child: Image.network('https://gd-hbimg.huaban.com/6b5146b6660c2eaac71f0c0c179cf9d4f71c681d5bc44-dyFWUa_fw658')
              child: Image.asset('images/icon/cat.webp', alignment: Alignment.center, // 혹시 이미지 사이즈가 정사각형 아닐까봐 사이즈 맞추기.
                fit: BoxFit.cover,
                width: 300, height: 300),
              )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final bool is_cat;
  
  SecondPage({required this.is_cat});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        leading: Icon(Icons.cruelty_free),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context, true);
      }, child: Text('Back!'),),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                print('is_cat: $is_cat');
              },
              // child: Image.network('https://image.dongascience.com/Photo/2022/06/6982fdc1054c503af88bdefeeb7c8fa8.jpg')
              child: Image.asset('images/icon/dog.jpg',alignment: Alignment.center, // 실제로 실행햇을 때 이미지가 작아서 세로로 긴 이미지로 나옴... boxfit시키기.
                  fit: BoxFit.cover, width: 300, height: 300
              )
            )
          ],
        ),
      ),
    );
  }
}