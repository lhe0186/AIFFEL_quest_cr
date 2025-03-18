import 'package:flutter/material.dart';
import '../services/diary_service.dart';
import '../models/diary_entry.dart';
import 'diary_screen.dart';

class DiaryListScreen extends StatefulWidget {
  @override
  _DiaryListScreenState createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  final DiaryService _diaryService = DiaryService();
  List<DiaryEntry> _diaries = [];

  @override
  void initState() {
    super.initState();
    _loadDiaries();
  }

  void _loadDiaries() async {
    List<DiaryEntry> loadedDiaries = await _diaryService.getAllDiaries(); // 데이터를 먼저 가져오기
    setState(() {
      _diaries = loadedDiaries;
      _diaries.sort((a, b) => b.date.compareTo(a.date)); // 최신 순 정렬
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("📚 내 일기 목록"), backgroundColor: Colors.lightBlueAccent),
      body: _diaries.isEmpty
          ? Center(child: Text("저장된 일기가 없습니다 😢"))
          : ListView.builder(
        itemCount: _diaries.length,
        itemBuilder: (context, index) {
          final diary = _diaries[index];
          return Card(
            elevation: 4, // ✅ 그림자 효과
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // ✅ 둥글게
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                diary.date,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                diary.content.length > 50 ? diary.content.substring(0, 50) + "..." : diary.content,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiaryScreen(summary: diary.content)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
//           return ListTile(
//             title: Text(diary.date),
//             subtitle: Text(diary.content.length > 30 ? diary.content.substring(0, 30) + "..." : diary.content),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DiaryScreen(summary: diary.content)),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

