import 'package:hive/hive.dart';
import '../models/diary_entry.dart';

class DiaryService {
  // final Box _box = Hive.box('diaryBox'); // Hive 저장소
  late Box<DiaryEntry> _box;
  bool _isInitialized = false; // 초기화 상태 추가

  // DiaryService() {
  //   _initialize();
  // }

  // ✅ 1) 생성자에서 초기화 실행
  Future<void> initialize() async {
    if (!_isInitialized) {
      _box = await Hive.openBox<DiaryEntry>('diaryBox'); // ✅ 비동기 대기
      _isInitialized = true;
    }
  }

  // ✅ 2) 일기 저장 (초기화 대기)
  Future<void> saveDiary(String date, String content) async {
    await initialize(); // ✅ 먼저 초기화 확인
    final entry = DiaryEntry(date: date, content: content);
    await _box.put(date, entry);
  }

  // ✅ 3) 모든 일기 불러오기 (초기화 대기)
  Future<List<DiaryEntry>> getAllDiaries() async {
    await initialize(); // ✅ 먼저 초기화 확인
    return _box.values.toList().cast<DiaryEntry>();
  }

  // ✅ 4) 특정 날짜의 일기 불러오기
  Future<DiaryEntry?> getDiaryByDate(String date) async {
    await initialize(); // ✅ 먼저 초기화 확인
    return _box.get(date);
  }
}


//   DiaryService() {
//     _initialize();
//   }
//
//   void _initialize() async {
//     await Future.delayed(Duration(milliseconds: 500)); //지연 추가 (Hive 초기화 대기)
//     _box = Hive.box<DiaryEntry>('diaryBox');
//   }
//
//   // 1) 일기 저장 함수
//   void saveDiary(String date, String content) {
//     final entry = DiaryEntry(date: date, content: content);
//     _box.put(date, entry); // 날짜를 키로 사용하여 저장
//   }
//
//   // 2) 모든 일기 불러오기 함수
//   List<DiaryEntry> getAllDiaries() {
//     return _box.values.toList().cast<DiaryEntry>();
//   }
//
//   // 3) 특정 날짜의 일기 불러오기
//   DiaryEntry? getDiaryByDate(String date) {
//     return _box.get(date);
//   }
// }
