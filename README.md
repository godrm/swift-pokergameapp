# swift-pokergameapp

## 1단계. MVC 초기 작업 

#### 특이사항
- Storyboard에 독립적으로 존재하는 View를 두고 IBOutlet으로 연결해서 사용할 수도 있습니다.
- playerPanel 이란 이름으로 뷰를 deepcopy 복사해서 사용했습니다. 
- 항상 이렇게 쓰라고 권장하는 방법은 아니고, 이런 방법도 있다는 정도로 이해하세요.

![diagram](https://github.com/godrm/swift-pokergameapp/blob/MVC/diagram-step1.png?raw=true)

## 2단계. MVC + Oberver 구조

#### 특이사항
- PlayerPanel을 재사용하기 위해서 Xib 방식으로 바꿨습니다.
- PokerGame 객체 생성과 뷰 업데이트를 한꺼번에 처리하지 않고 옵저버 방식으로 View -> Model 흐름과 Model -> View 흐름을 분리했습니다.
- 일반적인 NotificationCenter 방식이 아니라 Combine 프레임워크 Publisher와 Subscriber를 사용했습니다. 
- PokerGame 객체를 계속해서 생성하는 것도 의도했던 겁니다. 이게 항상 좋은 방법은 아니지만, immutable 객체를 만드는 방식으로 충분히 가능하다는 겁니다.

![diagram](https://github.com/godrm/swift-pokergameapp/blob/MVC+Observer/diagram-step2.png?raw=true)

## 3단계. Network + Observer + Protocol Oriented 구조

#### 특이사항
- 요구사항에는 없었지만 Network 처리 동작을 추가했습니다.
- NetworkManager 와 PokerGame 구체타입에 의존하지 않고, `<NetworkManagable>`과 `<GameDataSource>` 프로토콜에 의존하도록 개선했습니다. 
- 어떤 객체가 어떤 경우에 만들어지는지 Usecase를 도입했습니다.
- 임시로 동작하는 Mock과 Stub 객체를 어떤 식으로 구현하는지 표현했습니다.
- 초기 화면을 네트워크 처리하고 비동기 방식으로 구현했습니다.
- 다른 구조는 그대로 남겨놨습니다. 

![diagram](https://github.com/godrm/swift-pokergameapp/blob/Network/diagram-step3.png?raw=true)
