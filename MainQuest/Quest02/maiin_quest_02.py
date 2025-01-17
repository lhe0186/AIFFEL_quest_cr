# 간단한 자동사냥 RPG 게임을 만들어봅시다! 사용자의 이름을 입력 받아 플레이어를 생성하고,
# 몬스터들을 차례로 자동사냥하는 게임을 만들어보고자 합니다.
# Q1. Character 클래스 만들기
###### 이름, 레벨, 체력, 공격력, 방어력의 속성을 가짐
###### 인스턴스의 현재 체력이 0 이상인지 bool 값을 반환하는 is_alive 메서드 만들기
# 공격을 받았을 때, (받은 데미지 - 본인의 방어력)만큼 현재 체력이 감소하는 take_damage 메서드 만들기
#   본인의 방어력이 데미지보다 크다면 체력 감소하지 않음
# 타겟에게 데미지를 입히는 attack_target 메서드 만들기
#   데미지는 1부터 공격력 사이의 랜덤한 정수
import random


class Character:
    def __init__(self, name, level, health, attack, defense):
        self.name = name
        self.level = level
        self.health = health
        self.attack = attack
        self.defense = defense

    def is_alive(self):
        if self.health > 0:
            return True
        else:
            return False

    def take_damage(self, damage):

        if self.defense > damage:
            # self.health -= 0
            import time

            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            time.sleep(1.0)
            print("🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️")
            print("🛡️ \t\t\t 절 대 방 어  \t\t\t  🛡️")
            print("🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️🛡️")
            import time
            time.sleep(2.0)
        else:
            self.health -= (damage - self.defense)
        print(f"{self.name}의 체력: {self.health}")
        # 고블린의 체력: 5

    def attack_target(self, target_class):
        attack_damage = random.randint(1, self.attack)
        target_class.take_damage(attack_damage)
        print(f"{self.name}이 {target_class.name}에게 {attack_damage}만큼 공격했다...!")
        import time
        time.sleep(0.7)
        # 히어로이 고블린에게 17만큼 공격했다...!



#### Q 2
# Q2. Player 클래스와 Monster 클래스 만들기
# Character 클래스를 상속 받는 Player와 Monster 클래스를 만들기
# Player 클래스
# Character를 상속 받기
# 레벨 1, 체력 100, 공격력 25, 방어력 5로 초기화하기
# Player 클래스는 경험치 속성을 추가로 가짐
# 인수로 받은 정수 만큼 경험치를 획득하는 gain_experience 메서드 만들기
# 현재 경험치가 50이상이면 레벨을 1, 공격력을 10, 방어력을 5씩 올리는 level_up 메서드 만들기


class Player(Character):
    def __init__(self, name):
        super().__init__(name=name, level=1, health=100, attack=25, defense=5)
        self.exp = 0

    def gain_experience(self, new_exp):
        self.exp += new_exp
        if self.exp > 50:
            self.level_up()

    def level_up(self):
        self.level += 1
        self.attack += 10
        self.defense += 5
        self.exp -= 50




# Monster 클래스
# Character를 상속 받기
# 몬스터의 레벨에 비례하는 체력, 공격력, 방어력 초기화하기
# 체력: 10~30 사이의 랜덤한 정수 * 레벨
# 공격력: 5~20 사이의 랜덤한 정수 * 레벨
# 방어력: 1~5 사이의 랜덤한 정수 * 레벨

class Monster(Character):
    def __init__(self, name, level):

        new_health = random.randint(10, 30) * level
        new_attack = random.randint(5, 20) * level
        new_defense = random.randint(1, 5) * level

        super().__init__(name=name, level=level, health=new_health,
                         attack=new_attack, defense=new_defense)




## Q 3
# Q3. battle 함수 만들기
# battle 함수
# Player 인스턴스와  Monster 인스턴스를 인수로 받아 둘 중 하나의 체력이 0 이하가 될 때까지 공격을 주고 받는 함수
# 만약 Player 인스턴스가 살아남았다면
# Player 인스턴스에 (몬스터 레벨 * 20)만큼의 경험치를 추가
# player의 레벨업 메서드 호출
# ‘전투 승리!’를 출력
# Player 인스턴스가 살아남지 못했을 경우
#  ‘전투 패배..’를 출력하기

def battle(player_class: Player, monster_class: Monster):
    # player_class, monster_class

    while True: # 죽을때 까지 싸워 봐라
        # 쿵쾅쿵쾅
        player_class.attack_target(monster_class)
        monster_class.attack_target(player_class)

        # 둘중 하나는 주겄을때 지금부터 서로 죽을때까지 싸워라를 끝낸다.
        if player_class.is_alive() == False or monster_class.is_alive() == False:
            break

    # 힘든 싸움이었다...
    if player_class.is_alive():
        player_class.gain_experience(monster_class.level * 20)
        print("전투 승리!")
        print() # ?
    else:
        print(f"아이고 {player_class.name} 전투 패배... ㅠ")


## Q 4
# 몬스터의 이름, 레벨이 매핑된 딕셔너리 정의하기
# monster_dict = {‘슬라임’: 1, ‘고블린’: 2, ‘오크’: 3}
# 사용자로부터 이름을 입력받아 Player 인스턴스 생성하기
# 몬스터 딕셔너리로부터 Monster 인스턴스 생성하기
# 생성된 Monster 인스턴스와 Player 인스턴스가 battle 함수를 통해 전투
# player는 생성된 몬스터 3마리(슬라임, 고블린, 오크)와 모두 전투해야함
# 전투 도중에 Player가 사망하면 이후 전투를 진행하지 않고 ‘게임오버’ 출력하고 종료


def main():
    monster_dict = {'슬라임': 1, '고블린': 2, '오크': 3}
    player_class = Player(name="김시원") # 김시원 용사 출격
    # battle()

    for monster_name, monster_level in monster_dict.items():
        monster_class = Monster(name=monster_name, level=monster_level)

        print(f"{monster_class.name}과의 전투를 시작합니다.")
        # 지금부터 서로 싸워라
        battle(player_class, monster_class)

        # 플레이어가 게임오버 됐는지 확인
        if player_class.is_alive() == False:
            print("게임오버")
            break

main()

## 고블린과의 전투를 시작합니다.
##
##
## 고블린이 히어로에게 14만큼 공격했다...!
