import random

class Account:
    # 계좌 생성 개체 카운트
    account_count = 0
    total_account_info = []

    def __init__(self, name, balance):
        self.first_balance = balance
        self.deposit_count = 0
        self.deposit_log = []
        self.withdrawal_log = []

        self.name = name
        self.balance = balance
        self.bank = "SC은행"
        # 계좌번호 예시 : 111-11-111111
        num1 = random.randint(0,999)
        num2 = random.randint(0,99)
        num3 = random.randint(0,999999)

        num1 = str(num1).zfill(3)
        num2 = str(num2).zfill(2)
        num3 = str(num3).zfill(6)
        self.account_num = num1 + '-' + num2 + '-' + num3

        Account.account_count += 1
        Account.total_account_info.append(self)


    @classmethod
    def get_accounts(cls):
        print(f'생성된 계좌의 총 개수: {cls.account_count}')


    def deposit(self,amount):
        if amount >= 1:
            # type = '입금'
            self.balance += amount
            self.deposit_count += 1
            self.deposit_log.append(amount)
            if self.deposit_count % 5 == 0:
                self.balance = self.balance*1.01
                self.balance_interest = self.balance *0.01
                self.deposit_log.append(amount)
                print(f'{self.balance_interest:.2f}원의 이자가 입금되었습니다.')
        else:
            print('입금 금액은 1원이상 부터 가능합니다.')

    def withdrawal(self,amount):
        if self.balance >= amount:
            # type = '출금'
            self.balance -= amount
            self.withdrawal_log.append(amount)
        else:
            print('계좌 잔고 이상으로 출금할 수 없습니다.')

    def display_info(self):
        print(f"은행이름: {self.bank}, 예금주: {self.name}, 계좌번호: {self.account_num}, 잔액: {self.balance:,}")

    def deposit_history(self):
        # for amount in self.deposit_log:
        #     print(amount)
        for i in range(len(self.deposit_log)):
            print(f'{i+1}회:입금   금액:{self.deposit_log[i]}   잔액:{sum(self.deposit_log[:i+1])+self.first_balance}')

    def withdrawal_history(self):
        # for amount in self.withdrawal_log:
        #     print(amount)
        for i in range(len(self.withdrawal_log)):
            # 입출금 시점 정보 필요.
            print(f'{i+1}회:출금   금액:{self.deposit_log[i]}   잔액:{-sum(self.deposit_log[:i+1])+self.balance}')



first_account = Account("Haeun",300000)
second_account = Account("Minsu", 1500000)
third_account = Account("Goeun", 5400000)

print(Account.account_count)
Account.get_accounts()


for info in Account.total_account_info:
    if info.balance >= 1000000:
        info.display_info()


for i in range(10):
    first_account.deposit(1000)
first_account.deposit(-1000)
first_account.withdrawal(3000000)
first_account.withdrawal(3000)


first_account.deposit_history()
print('-'*50)
first_account.withdrawal_history()
