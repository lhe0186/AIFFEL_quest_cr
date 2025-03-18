import 'package:hive/hive.dart';

part 'diary_entry.g.dart';

@HiveType(typeId: 0) //Hive 데이터 모델 등록
class DiaryEntry {
  @HiveField(0) // 저장 필요한 필드 정의.
  String date; // 지정한 년,월,일 형식으로 저장...되겠지?

  @HiveField(1)
  String content; // 일기 내용

  // @HiveField(2)
  // DateTime date;

  DiaryEntry({required this.date, required this.content});
}
