
# 전체 메뉴와 가격
menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
price = [2000, 3000, 3000, 2500, 2500, 3000]

class Kiosk:
    def __init__(self):
        self.menu = menu
        self.price = price
        self.order_menu = [] # _MS_ add order_menu
        self.order_price = [] # _MS_ add order_price

    # 메뉴 출력 메소드
    def menu_print(self):
        for i in range(len(self.menu)):
            print(i+1, self.menu[i], ':', self.price[i], '원')

    # 메뉴 주문 메소드
    def menu_select(self):
        print()  # 줄 바꿈
        n = 0
        while n < 1 or len(menu) < n: # 주문한 개수 0일 때, 또는 셀렉한 메뉴보다 수량이 많을 때 :
            n = int(input('음료 번호를 입력하세요:')) # 음료 번호 입력

            if 1 <= n and n <= len(menu):
                self.price_sum = self.price[n-1] # 선택 음료의 가격
                print('주문 음료:', self.menu[n - 1], ':', self.price[n - 1], '원')
                self.order_price.append(self.price[n-1]) # _MS_ add order_price

            else:
                print('없는 메뉴입니다. 다시 주문해 주세요.')

        # 음료 온도 물어보기
        t = 0   # 기본값 넣어주시
        while t != 1 and t !=2: # 1이나 2를 입력할 때까지 물어보기.
            t = int(input('Hot 음료는 1을, Ice 음료는 2를 입력하세요:'))
            if t == 1:
                self.temp = 'Hot'
            elif t == 2:
                self.temp = 'Ice'
            else:
                print('1, 2 중에서 하나를 입력하세요.\n')

        self.order_menu.append(self.temp + ' ' + self.menu[n-1]) # 주문 리스트에 추가한다.
        print(self.temp, self.menu[n - 1], ':', self.price[n - 1], '원')

        # 추가 주문 또는 지불
        while n != 0 : # 지불을 선택하기 전까지 반복하기.
            print()     # 줄바꿈
            n = int(input('추가 주문은 음료 번호를, 지불은 0을 입력하세요:')) # 추가 주문 또는 지불
            if n > 0 and n < len(self.menu) + 1:
                # print()  # 줄 바꿈
                # n = 0
                while n < 1 or len(menu) < n:  # 주문한 개수 0일 때, 또는 셀렉한 메뉴보다 수량이 많을 때 :
                    # n = int(input('음료 번호를 입력하세요:'))  # 음료 번호 입력

                    if 1 <= n and n <= len(menu):
                        self.price_sum = self.price[n - 1]  # 선택 음료의 가격
                        print('주문 음료:', self.temp, self.menu[n - 1], ':', self.price[n - 1], '원')

                    else:
                        print('없는 메뉴입니다. 다시 주문해 주세요.')

                # 음료 온도 물어보기
                t = 0  # 기본값 넣어주시
                while t != 1 and t != 2:  # 1이나 2를 입력할 때까지 물어보기.
                    t = int(input('Hot 음료는 1을, Ice 음료는 2를 입력하세요:'))
                    if t == 1:
                        self.temp = 'Hot'
                    elif t == 2:
                        self.temp = 'Ice'
                    else:
                        print('1, 2 중에서 하나를 입력하세요.\n')

                self.order_menu.append(self.temp + ' ' + self.menu[n - 1])  # 주문 리스트에 추가한다.
                self.order_price.append(self.price[n - 1])  # _MS_ add order_price
                print(self.temp, self.menu[n - 1], ':', self.price[n - 1], '원')
                print("추가 주문 음료", self.order_menu[0])
                # print('추가 주문 음요') # 기존 + 추가 주문의 메뉴 + 가격을 출력)
            else:
                if n == 0:
                    print('주문이 완료되었습니다.')
                    print(self.order_menu, self.order_price)
                else:
                    print('없는 메뉴입니다. 다시 주문해 주세요.')



    def pay(self):
        pay_money = int(input("현금으로 결제 시: 1, 카드로 결제시 2를 입력 해 주세요."))
        if pay_money == 1:
            print("직원을 호출하겠습니다.")
        elif pay_money == 2:
            print("IC칩 방향에 맞게 카드를 꽂아주세요.")
        else:
            print("지불 방식을 입력해 주세요.")

    def table(self):
        # menu_temp = ['HOT americano', 'ICE latte', 'ICE mocha', 'ICE choco_latte']
        # price_temp = [2000, 3000, 3000, 3000]

        # 외곽
        print('⟝' + '-' * 30 + '⟞')
        for i in range(5):
            print('|' + ' ' * 31 + '|')

        # 주문 상품명 : 해당 금액
        for i in range(len(self.order_menu)):
            print(self.order_menu[i], ' : ', self.order_price[i])

        print('합계 금액 :', sum(self.order_price))

        # 외곽
        for i in range(5):
            print('|' + ' ' * 31 + '|')
        print('⟝' + '-' * 30 + '⟞')


kiosk = Kiosk()
kiosk.menu_print()

kiosk.menu_select()
kiosk.pay()
kiosk.table()
