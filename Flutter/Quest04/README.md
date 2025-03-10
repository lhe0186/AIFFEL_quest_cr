# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 이하은
- 리뷰어 : 정성욱


# PRT(Peer Review Template)
- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인

      --> 최종 완성은 이루어 지지 않았다.
      
    
- [x]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭을 왜 핵심적이라고 생각하는지 확인
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드의 기능, 존재 이유, 작동 원리 등을 기술했는지 확인
    - 주석을 보고 코드 이해가 잘 되었는지 확인

        --> 설명으로 주석은 갈음한다.
      ![image](https://github.com/user-attachments/assets/8500dcd9-5621-4288-963b-709dedca784d)

        
- [x]  **3. 에러가 난 부분을 디버깅하여 문제를 해결한 기록을 남겼거나
새로운 시도 또는 추가 실험을 수행해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인
    - 프로젝트 평가 기준에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인

        --> 설명으로 갈음한다.
        
- [x]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 기록되어 있는지 확인
    - 전체 코드 실행 플로우를 그래프로 그려서 이해를 돕고 있는지 확인

       -->
      ![image](https://github.com/user-attachments/assets/42b522cd-d721-4713-af5f-e96dbad08044)

        
- [x]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화/모듈화했는지 확인
        
        --> 알아보기 쉽게 작성되어 있다.


# 회고(참고 링크 및 코드 개선)
```
# 리뷰어의 회고를 작성합니다.
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```


# 스픽 앱 분석 및 역설계 하기        

## 앱 정보

- **앱 이름** 

  - 스픽

- **시장(마켓)**  

  - 인공지능과 영어회화를 결합하여 발음을 교정받을 수 있는 최신 영회화 공부 앱. 다국어 지원가능.

- **타겟**  

  - 내일 긴 시간 들이기 힘들고 짜투리 시간을 활용하여 영회화를 효율적으로 연습하고 싶은 20~50대을 타겟팅함.       



## 앱 구조도

https://www.notion.so/image/attachment%3Acd4f0bad-3568-4935-a0d0-5c33bbe2032b%3Aimage.png?table=block&id=1af5c8e5-427d-80f9-ad1a-c9bc46bc7d36&spaceId=c09f8228-29c7-4dcb-8ca3-1de7d3988fab&width=1800&userId=14dd872b-594c-816c-90b8-0002fe420f87&cache=v2


## 앱 와이어프레임 (사용 툴 : 굿노트)

![image](https://github.com/user-attachments/assets/28dcb528-45b6-4c4c-b958-780ff117896a)



## 프로토타이핑 (사용 툴 : creatie)

https://www.notion.so/image/attachment%3A07454177-2868-425d-87ab-b452fba45c75%3Aimage.png?table=block&id=1b25c8e5-427d-80ea-a559-d05f3c8e1777&spaceId=c09f8228-29c7-4dcb-8ca3-1de7d3988fab&width=1800&userId=14dd872b-594c-816c-90b8-0002fe420f87&cache=v2
https://www.notion.so/image/attachment%3A9654103e-896a-488b-a13e-b1965061c114%3Aimage.png?table=block&id=1b25c8e5-427d-80e6-be0b-f11221b905dd&spaceId=c09f8228-29c7-4dcb-8ca3-1de7d3988fab&width=1800&userId=14dd872b-594c-816c-90b8-0002fe420f87&cache=v2
https://www.notion.so/image/attachment%3A2a9fdacd-ea33-45b7-a77a-b9cbe53ae61a%3Aimage.png?table=block&id=1b25c8e5-427d-80ee-b170-f8d634202159&spaceId=c09f8228-29c7-4dcb-8ca3-1de7d3988fab&width=1800&userId=14dd872b-594c-816c-90b8-0002fe420f87&cache=v2


## 페이지 구현
1. 메인 화면으로 기본적인 구성으로만 작성 되어 있습니다.
2. 언더바로 통해 홈화면, 프리톡, 리뷰, 챌린지, 프로필 5개의 페이지에서 이동가능.(단, 홈과 프리톡에만 위젯 구성함. 기타는 아직 빈화면)
3. 홈에서 '시작하기'를 클릭하면 코스 선택 페이지로 이동함.


## 구현영상 
file:///Users/i_haeun/Desktop/%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%91%E1%85%A6%E1%86%AF_%5B%E1%84%8F%E1%85%A9%E1%84%8B%E1%85%A5%5D/Screen_recording_20250310_165321.webm


## 참고 학습 자료 


## 회고
시간 분배 실패하여 원하는 내용을 제대로 구성하지 못했다. 다음에는 보다 빠르게 프로그램 실행 단계에 집입하여 구현하는데에 더 많은 시간을 들이도록 하겠다. 
물론 설계하는 시간도 너무 재밌었고 프로토타입을 만드는 과정도 흥미로웠지만 욕심이 너무 많아 가장 중요한 플러터 실현을 제대로 하지 못했다...
다음에는 꼭 이 부분을 

