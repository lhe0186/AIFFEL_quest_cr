// 1. 타이머 시작 → "Pomodoro 타이머를 시작합니다." 출력
// 2. 25분 작업 시간 → 1초씩 감소하면서 콘솔에 출력
// 3. 5분 휴식 시간 (4회차 전까지) → 1초씩 감소하면서 콘솔에 출력
// 4. 4회차 후 15분 휴식 → 1초씩 감소하면서 콘솔에 출력
// 5. 반복 → 4회 반복 후 초기화

//Timer.periodic? : 다트의 비동기 타이머로, 일정한 주기마다 특정 함수를 실행하는 역할을 수행.
// 즉, 일정 간격으로 반복 실행할 때 유용해!

import 'dart:async'; //Timer를 사용하려면 필요.

class PomodoroTimer {
  static const int workDuration = 25 * 1; // 25분
  static const int shortBreakDuration = 5 * 1; // 5분
  static const int longBreakDuration = 15 * 1; // 15분
  int cycleCount = 0; // 현재 사이클 개수

  void start() {
    print("Pomodoro 타이머를 시작합니다.");
    _startWorkSession();
  }

  void _startWorkSession() {
    if (cycleCount == 4) {
      print('4회 작업 완료! Pomodoro 타이머를 종료합니다.');
      return;
    }
    int timeLeft = workDuration;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        int minutes = timeLeft ~/ 1;
        int seconds = timeLeft % 1;
        print("flutter: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}");
        timeLeft--;
      } else {
        timer.cancel();
        cycleCount++;
        print("작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.");
        _startBreakSession();
      }
    });
  }
  void _startBreakSession() {
    // int breakDuration = (cycleCount % 4 == 0) ? longBreakDuration : shortBreakDuration; // 일단은 4 사이클 돌고 프로그램 종료.
    int breakDuration = (cycleCount % 4 == 0) ? longBreakDuration : shortBreakDuration;
    int timeLeft = breakDuration;

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        int minutes = timeLeft ~/ 1;
        int seconds = timeLeft % 1;
        print("flutter: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}");
        timeLeft--;
      } else {
        timer.cancel();
        print("휴식 시간이 종료되었습니다. 다음 작업을 시작합니다.");
        _startWorkSession();
      }
    });
  }
}

void main() {
  PomodoroTimer timer = PomodoroTimer();
  timer.start();
}