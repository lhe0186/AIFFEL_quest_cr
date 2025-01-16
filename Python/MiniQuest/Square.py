class Square:

    def __init__(self):  # 생성자__init__의 매개변수의 첫번째는 self여야 합니다.
        self.square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요.\n 1.직사각형 2.평행사변형 3.사다리꼴 \n >>>'))  # 입력값을 int로 묶어야 합니다.

        if self.square == 1:
            print('직사각형 함수는 rect()입니다.')  # Square 클래스에 rect() 메서드를 추가합니다.
            # 가로, 세로 = map(int,input('가로, 세로를 입력하세요. 예시 : 가로,세로').split(','))

        elif self.square == 2:
            print('평행사변형 함수는 par()입니다.')  # Square 클래스에 par() 메서드를 추가합니다.

        elif self.square == 3:
            print('사다리꼴 함수는 trape()입니다.')  # Square 클래스에 trape() 메서드를 추가합니다.

        else:
            print('1, 2, 3 중에서 다시 입력해주세요')

    # 직사각형, 평행사변형, 사다리꼴의 계산 수식 담은 함수 정의하기.
    def rect(self): # 직사각형: 가로 x 세로
        width, vertical = map(int,input('가로,세로를 입력하세요. 예시: 가로,세로\n >>>').split(','))
        area = width * vertical
        result = '직사각형의 넓이는 :' + str(area)
        return result
    def par(self): # 평행사변형: 밑변 x 높이
        width, high = map(int, input('밑변,높이를 입력하세요. 예시: 밑변,높이\n >>>').split(','))
        area = width * high
        result = '평행사변형의 넓이는:'+ str(area)
        return result
    def trape(self): # 사다리꼴: (밑변 + 윗변) x 높이 x 1/2
        width1, width2, high = map(int, input('사다리꼴의 밑변,윗변,높이를 입력하세요. 예시: 밑변,윗변,높이\n >>>').split(','))
        area = (width1 + width2) * high / 2
        result = '사다리꼴의 넓이는:'+ str(area)
        return result

a = Square()
print(a.trape())
