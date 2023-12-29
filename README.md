# **🧃쥬스자판기**

쥬스를 선택하면 해당 쥬스의 재료가 차감되고 과일의 재고를 수정할 수 있도록 구현한 프로젝트 입니다.

---

## **목차**
- 🙋‍♂️ [**팀원**](#-팀원)
- 📂 [**폴더 구조**](#-폴더-구조)
- 📱 [**실행 화면(기능 설명)**](#-실행-화면(기능-설명))
- 🚀 [**트러블 슈팅**](#-트러블-슈팅)
- 📘 [**참고 링크**](#-참고-링크)
- 🏁 [**팀 회고**](#-팀-회고)

---

## **🙋‍♂️ 팀원**
| [L](https://github.com/LeeSe0ngYe0n) | [Kyle](https://github.com/Changhyun-Kyle) |
| :--------: | :--------: |
|<img src=https://hackmd.io/_uploads/SkMyCCGv6.png height="150"/> |<img src=https://github.com/tasty-code/ios-rock-scissor-paper/assets/148876644/e4308de2-584b-4bc7-ac9d-659d1962ab22 height="150"/> | 

---

## **📂 폴더 구조**
```
├── JuiceMaker
│   ├── App
│   │   ├── AppDelegate.swift
│   │   └── SceneDelegate.swift
│   ├── Controller
│   │   ├── FruitStoreViewController.swift
│   │   ├── JuiceMaker.swift
│   │   └── JuiceMakerViewController.swift
│   ├── Model
│   │   ├── FruitStore.swift
│   │   ├── FruitStoreDelegate.swift
│   │   ├── Fruits.swift
│   │   ├── Juice.swift
│   │   ├── JuiceMaker.swift
│   │   ├── JuiceMakerAlert.swift
│   │   └── JuiceMakerError.swift
│   ├── Resource
│   │   ├── Assets.xcassets
│   │   │   └── Contents.json
│   │   └── Base.lproj
│   │       └── LaunchScreen.storyboard
│   ├── View
│   │   └── Base.lproj
│   │       └── Main.storyboard
│   ├── Info.plist
└── JuiceMakerTests
    └── JuiceMakerTests.swift
```

---

## **📱 실행 화면(기능 설명)**
|앱 진입 화면|쥬스 만들기 성공 시|
|:--------:|:--------:|
|![simulator_screenshot_55A5CA4D-EA2B-495F-9389-DC2887BBA31E](https://hackmd.io/_uploads/B1rAW17wa.png)|![simulator_screenshot_DB5D6177-7BA1-4A90-8C22-0B4DAEC458E2](https://hackmd.io/_uploads/H1ZFGyXPp.png)|
|**과일 재고(하나) 부족 시**|**과일 재고(모두) 부족 시**|
|![simulator_screenshot_B9F16EB3-159E-4929-903D-85D922E68BC4](https://hackmd.io/_uploads/HJzyQkXDa.png)|![simulator_screenshot_8B5C99B2-B896-44EB-92DF-E5402E24213E](https://hackmd.io/_uploads/r1aZmkmPp.png)|
|**재고 수정 화면**|**과일 재고 수정 기능**|
|![simulator_screenshot_30457F41-EB21-49BA-A87E-CC847ED62B5C](https://hackmd.io/_uploads/SkUHXk7va.png)|![simulator_screenshot_EC2ABEA9-688A-478D-8796-1CFB21C3B036](https://hackmd.io/_uploads/SJgFQyQv6.png)|
|**재고 수정 반영**|**실행 화면**|
|![simulator_screenshot_9F01B1FB-4F68-49CD-8080-77F53C4AB18B](https://hackmd.io/_uploads/rkX2mJmvp.png)|![Simulator Screen Recording - iPhone 15 Pro - 2023-12-27 at 16.19.25 (1)](https://hackmd.io/_uploads/H1VVbIFwT.gif)

---

## **🚀 트러블 슈팅**
- [**STEP1**](https://github.com/tasty-code/ios-juice-maker/pull/75/files#diff-dfbf2eb3322b69aced027f4a89948ecaa4419ba35f83163e3aababfe83f45be4)
- [**STEP2**](https://github.com/tasty-code/ios-juice-maker/pull/86)
- [**STEP3**](https://github.com/tasty-code/ios-juice-maker/pull/117)
- ### **Class VS Struct**
    - **`Class`**: 참조 타입
        - `Stack`에 메모리 주소값을 저장 후 `VTable`을 통해 `Heap` 영역에 할당
        - `ARC`를 통해 메모리 관리
        - `dynamic dispatch`: 런타임 시 어떤 메소드를 사용할 지 결정
        - 상속 가능
    - **`Struct`**: 값 타입
        - `Stack`에 메모리 할당
        - `static dispatch`: 컴파일 타임 시 어떤 메소드를 사용할 지 결정
        - `protocol` 이외 상속 불가
        - 값 타입에서는 값을 수정하기 위해서는 `mutating` 키워드를 사용
    - **결론**
        - 메모리에 할당하고 저장하는 방식의 차이
        - `Class` 타입의 경우 `Struct`과 달리 `VTable`을 통해 `Heap` 영역에 메모리가 할당되기 때문에 비용적인 부담이 존재
        - `Class` 타입의 객체가 서브클래싱이나 상속을 하지 않는 경우 `final` 키워드를 통해 `static dispatch` 구현 가능
        - `Struct`가 `Class`에 비해 비용적인 부담은 적지만 상속과 다형성 측면에서 제약이 있기 때문에 구현하고자하는 방향에 따라 적절하게 선택
        - 구조체의 경우에 인스턴스 생성 시 let으로 선언하면 스택에 저장된 속성 모두가 let으로 되어버리기 때문에 값을 변경할 수 없다.
        - 클래스의 경우 인스턴스 생성 시 let으로 선언하면 스택영역에 저장된 메모리 주소를 변경할 수 없다는 의미이기 때문에 속성의 값은 변경할 수 있다.
- ### **`switch문`  ➡️  딕셔너리 타입** 
    - https://github.com/tasty-code/ios-juice-maker/pull/86/commits/f7203a79151bcb1797664a79e9c3921262033ebf
    - SOLID 원칙을 고려하여 프로그래밍을 진행
    - 하지만, 기존 `switch문`을 활용한 방식은 개방-폐쇄 원칙에 위배된다고 판단(과일의 종류가 변경될 때 모든 `switch문`의 `case`를 수정해야함)
        > 개방-폐쇄 원칙(OCP, Open-Closed Principle): 소프트웨어 개체(클래스, 모듈, 함수 등등)는 확장에 대해 열려 있어야 하고, 수정에 대해서는 닫혀 있어야 한다
    - 따라서, `switch문`을 딕셔너리 타입으로 리팩토링
        ```swift
        // 수정 전
        var strawberryStock: Int
        var bananaStock: Int
        var pineappleStock: Int
        var kiwiStock: Int
        var mangoStock: Int
    
        func manageFruitsStocks(_ fruit: Fruits, count: Int) {
            switch fruit {
            case .strawberry:
                self.strawberryStock = count
            case .banana:
                self.bananaStock = count
            case .pineapple:
                self.pineappleStock = count
            case .kiwi:
                self.kiwiStock = count
            case .mango:
                self.mangoStock = count
        }
             
        // 수정 후
        var fruitStock: [Fruits:Int]
            
        func manageFruitsStocks(fruit: Fruits, count: Int) {
            guard let name = fruitStock[fruit]  else { return }
            fruitStock[fruit] = count
        }
        ```
- ### **에러 핸들링**
    - 주스를 만들 때 필요한 과일이 부족한 경우에 대한 에러 핸들링 진행
    - 주어진 주스 레시피에는 단일 과일을 필요로 하는 주스와 여러 과일을 필요로 하는 주스가 존재
    - 하지만, 명세서에는 과일 재고가 부족할 시 `재고 없음`이라는 문구만 출력
    - 따라서, 정확히 어떤 과일의 재고가 부족한지 `error` `case`의 파라미터로 `fruit` 타입을 받을 수 있게 선언
    - 또한, `LocalizedError`를 채택하여 구현부에서 더 간단하게 `error`를 출력할 수 있게 리팩토링
    - 현재 `try`를 통해 `throw`하는 `error` `case`가 재고가 없는 경우 한 가지이기 때문에 구현부에서 `switch문`으로 분기처리를 하는 것이 아닌 `catch`문에서 바로 출력될 수 있도록 리팩토링
        ```swift
        // 수정 전
        func makeJuice(juice: Juice) {
            do {
                try checkUnderstockedFruits(juice: juice)
                for (fruit, count) in juice.recipe {
                    fruitStore.useJuiceIngredient(fruit, count: count)
                }
            } catch {
                switch error {
                case JuiceMakerError.outOfStock(let fruit):
                    print("\(fruit) 재고 없음")
                default:
                    print("알 수 없는 에러 발생")
                }
                for (fruit, count) in juice.recipe {
                    fruitStore.useJuiceIngredient(fruit: fruit, count: count)
                }
            }
        }

        // 수정 후
        enum JuiceMakerError: LocalizedError {
            case outOfStock(fruit: String)
    
            var errorDescription: String? {
                switch self {
                case .outOfStock(let fruit):
                    return "\(fruit)가 모자라요. 재고를 수정할까요?"
                }
            }
        }

        func makeJuice(juice: Juice) throws {
            do {
                try checkUnderstockedFruits(juice: juice)
                for (fruit, count) in juice.recipe {
                    fruitStore.useJuiceIngredient(fruit, count: count)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        ```
- ### **@IBAction ➡️ `switch문` 활용하지 않고 함수로 분기**
    - 과일의 재고를 관리하는 `Stepper`를 하나의 `@IBAction`에 `switch`문을 활용하여 분기처리를 진행
    - 코드의 중복성 및 가독성이 좋지 않고 하나의 `@IBAction`에 여러개의 `Stepper`를 연결했기 때문에 유지보수을 하기 좋은 코드가 아니라는 판단
    - 중복되는 코드를 함수로 빼준 후 유지보수를 위해 `@IBAction`을 과일 별로 연결하게 리팩토링
        ```swift
        // 수정 전
        @IBAction func fruitsStockStepperTapped(_ sender: UIStepper) {
            switch sender {
            case strawberryStepper:
                strawberryStockLabel.text = String(Int(sender.value))
                delegate?.updateFruitStock(fruit: .strawberry, count: Int(sender.value))
            case bananaStepper:
                bananaStockLabel.text = String(Int(sender.value))
                delegate?.updateFruitStock(fruit: .banana, count: Int(sender.value))
            case pineappleStepper:
                pineappleStockLabel.text = String(Int(sender.value))
                delegate?.updateFruitStock(fruit: .pineapple, count: Int(sender.value))
            case kiwiStepper:
                kiwiStockLabel.text = String(Int(sender.value))
                delegate?.updateFruitStock(fruit: .kiwi, count: Int(sender.value))
            case mangoStepper:
                mangoStockLabel.text = String(Int(sender.value))
                delegate?.updateFruitStock(fruit: .mango, count: Int(sender.value))
            default:
                print("error")
            }
        }
        // 수정 후
        private func updateFruitStock(label: UILabel, fruit: Fruits, count: Int) {
            label.text = String(count)
            fruitStore.fruitStocks[fruit] = count
        }
    
        @IBAction private func tappedStrawberryStepper(_ sender: UIStepper) {
            updateFruitStock(label: strawberryStockLabel,
                             fruit: .strawberry,
                             count: Int(sender.value))
        }
        ```
- ### **순서가 없는 컬렉션: 딕셔너리**
    - 현재 과일의 재고를 딕셔너리 타입으로 관리
    - 하지만, 딕셔너리 타입은 순서가 없는 컬렉션이기 때문에 여러 종류의 과일을 재료로 사용하는 주스의 경우 과일의 재고가 랜덤하게 변경되는 버그 발생
    - 따라서, `.sorted`를 활용하여 딕셔너리의 `value`를 기준으로 정렬하여 로직 진행
        ```swift
        private func updateStockLabels(juice: Juice, labels: [UILabel]) {
            let sortedJuiceRecipe = juice.recipe.sorted { firstIngredient, secondIngredient in
                firstIngredient.value > secondIngredient.value
            }
            for (index, ingredient) in sortedJuiceRecipe.enumerated() {
                guard
                    let remainStock = fruitStore.fruitStocks[ingredient.key]
                else {
                    return
                }
                labels[index].text = String(remainStock)
            }
        }
        ```
- ### **의존성 주입(fruitStore)**
    - `instantiateViewController`를 사용하여 `initializer injection`을 할 수 있는 방법에는 두가지가 존재
    - **`instantiateViewController(identifier:creator:)`**: 스토리보드에서 지정된 뷰 컨트롤러를 생성하고 사용자 지정 초기화 코드를 사용하여 초기화
    - **`instantiateViewController(withIdentifier:)`**: 지정된 식별자를 가진 뷰 컨트롤러를 생성하고 스토리보드의 데이터로 초기화
    - `NSCoder`란 인터페이스이고 이를 구현하는 서브클래스는 어떤 객체를 메모리와 다른 데이터 포맷 사이에서 아카이빙(객체와 데이터를 디스크에 저장)과 디스트리뷰션(객체와 데이터를 서로 다른 프로세스나 스레드사이에서 복사)을 통해 전환을 가능하게 해주는 추상 클래스 
    - 따라서, init(coder:NSCoder)에서 Coder는 객체의 타입을 데이터와 함께 저장해두었다가 디코딩이될 때 이 타입을 그대로 사용하며 스토리보드나 nib 파일을 통해 뷰를 로드하면서 초기화
    - 결론적으로, `FruitStoreViewController`의 `fruitStore` 객체에 대한 의존성을 주입하기 위해 **`instantiateViewController(identifier:creator:)`** 로 리팩토링
        ```swift
        // 수정 전
        func showFruitStoreViewController() {
            guard
                let fruitStoreViewController = storyboard?.instantiateViewController(identifier: "FruitStoreViewController", creator: { coder in
                    return FruitStoreViewController(fruitStore: self.fruitStore, coder: coder)
                })
            else {
                fatalError("init(coder:) has not been implemented")
            }
            self.navigationController?.pushViewController(fruitStoreViewController, animated: true)
        }
        // 수정 후
        private func showFruitStoreViewController() {
            guard
                let fruitStoreViewController = storyboard?.instantiateViewController(identifier: "FruitStoreViewController", creator: { coder in
                    return FruitStoreViewController(fruitStore: self.fruitStore, coder: coder)
                })
            else {
                fatalError("init(coder:) has not been implemented")
            }
            fruitStoreViewController.delegate = self
            present(fruitStoreViewController, animated: true)
        }
        ```
- ### **내비게이션과 모달**
    - 명세서에 내비게이션바가 있어서 모달이 아닌 내비게이션을 선택
    - 그러나, `Modality`에 관한 공식문서를 확인했을 때
        > 사람들이 가장 최근에 한 행동을 확인하거나 수정할 수 있는 옵션을 제공합니다.
        > 사람들이 이전 컨텍스트를 잃지 않고 명확하고 범위가 좁은 작업을 수행할 수 있도록 지원하세요.
        > 사람들에게 몰입감 있는 경험을 제공하거나 복잡한 작업에 집중할 수 있도록 지원
    - 따라서, 명세서에 맞게 내비게이션바 구현 후 모달로 `present`
- ### **Alert Protocol**
    - `Alert`의 경우 앱 전반적으로 범용성 있게 사용할 수 있는 기능이라 확장성을 고려하여 `protocol`로 분기
    - 기존 코드에서는 `UIViewController`를 파라미터로 선언하여 해당 타입의 인스턴스를 `protocol` 내에서 활용
    - 하지만, `where`절을 통해 `UIViewController`를 지정하여 `UIViewController` 타입만 프로토콜을 채택할 수 있게 리팩토링하여 코드의 확장성과 효율성 확대
        ```swift
        // 수정 전
        extension JuiceMakerAlert {
            func showJuiceMakerAlert(viewController: UIViewController, isCompletedMakeJucie: Bool, message: String) {
                let alert = UIAlertController(title: "알림" , message: message, preferredStyle: .alert)
                guard
                    isCompletedMakeJucie
                else {
                    let juiceMakerViewController = JuiceMakerViewController()
                    alert.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
                        juiceMakerViewController.showFruitStoreViewController()
                    }))
                    alert.addAction(UIAlertAction(title: "아니요", style: .cancel))
                    viewController.present(alert, animated: true)
                    return
                }

                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                viewController.present(alert, animated: true)
            }
        }
        // 수정 후
        extension JuiceMakerAlert where Self: UIViewController {
            func showJuiceMakerAlert(message: String, actions: [UIAlertAction]) {
                let alert = UIAlertController(title: "알림",
                                              message: message,
                                              preferredStyle: .alert)
                for action in actions {
                    alert.addAction(action)
                }
                self.present(alert, animated: true)
        }
        ```
- ### **Delegate 패턴 vs NotificationCenter**
    - `FruitStoreViewController`가 `dismiss`된 후 `JuiceMakerViewController`가 나타날 때 이벤트를 발생시켜 `view` 업데이트 필요
    - 따라서, `Delegate`와 `NotificationCenter`를 고민
    - 현재 코드를 보면 `fruitStore`에 대한 의존성을 상위 뷰에서 주입하고 있기 때문에 데이터를 전달한다기 보다 데이터는 이미 적용되어 있고 `view`만 새로 업데이트 필요
    - 당시 Delegate는 데이터를 전달하는 개념을 갖고 있고, `NotificationCenter`는 이벤트를 발생시킨다는 개념을 갖고 있다고 생각하여 `NotificationCenter` 채택
    - 그러나, `NotificationCenter`는 싱글톤 객체를 기반으로 이벤트 발생여부를 옵저버를 등록한 객체에게 전달하는 방식으로 일대다(1:N)의 객체에 이벤트를 전달할 때 유용하고, `Delegate`의 경우 `protocol`을 정의하여 이벤트를 대신 처리할 객체가 채택하여 사용하는 방식으로 일대일(1:1)의 객체에 이벤트를 전달할 때 유용하다는 점을 알게 되어 `Delegate`패턴으로 리팩토링
        > **[Notification flow]**
        > - `Notification`은 이벤트가 발생하는 곳에서 `NotificationCenter.default.post` 메서드를 사용하여 `Notification`을 발송
        > - `Notification`을 받아야 객체는 `addObserver(_:selector:name:object:)` 메서드를 사용하여 옵저버로 등록
        > - 이후 등록된 옵저버에 의해 해당 `Notification`이 발생하면, 옵저버는 `selector`에 정의된 메서드를 호출하여 `Notification`을 처리
        > - 또한, `NotificationCenter`는 싱글톤 객체이기 때문에 객체가 더 이상 `Notification`을 수신하지 않을 때, `removeObserver(_:name:object:)` 메서드를 사용하여 옵저버를 해제


        ```swift
        // 수정 전
        // JuiceMakerViewController
        private func configureUI() {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(setUpContents),
                                                   name: NSNotification.Name("updateUINotification"),
                                                   object: nil)
        }
        // FruitStoreViewController
        @IBAction private func tappedCloseButton(_ sender: UIBarButtonItem) {
            NotificationCenter.default.post(name: NSNotification.Name("updateUINotification"), 
                                            object: nil)
            dismiss(animated: true)
       }

        // 수정 후
        // JuiceMakerViewController
        extension JuiceMakerViewController: JuiceMakerAlert, FruitStoreDelegate {
            func updateFruitStock() {
                setUpContents()
            }
        }
        // FruitStoreViewController
        @IBAction private func tappedCloseButton(_ sender: UIBarButtonItem) {
            delegate?.updateFruitStock()
            dismiss(animated: true)
        }
        ```

---

## **📘 참고 링크**
📘 [UnderStanding Swift Performance](https://developer.apple.com/videos/play/wwdc2016/416/)
📘 [if문과 guard문의 코드 가독성](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Early-Exit)
📘 [MVC VS Cocoa-MVC](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Model-View-Controller/Model-View-Controller.html#//apple_ref/doc/uid/TP40010810-CH14)
📘 [Alert HIG](https://developer.apple.com/design/human-interface-guidelines/alerts)
📘 [instantiateViewController를 사용하여 initializer injection을 할 수 있는 방법](https://developer.apple.com/documentation/uikit/uistoryboard/3213989-instantiateviewcontroller)
📘 [NSCoder](https://developer.apple.com/documentation/foundation/nscoder)
📘 [viewDidLoad](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621495-viewdidload)
📘 [Delegation](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html)
📘 [Notification](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Notification.html#//apple_ref/doc/uid/TP40008195-CH35-SW1)
📘 [AnyObject](https://developer.apple.com/documentation/swift/anyobject)

---

## **🏁 팀 회고**
카일: 엘과 함께여서 너무 행복했습니다. 다음에 또 만나요(+시온 사랑합니다)
엘: 카일과 함께여서 너무 행복했습니다. 다음에 또 만나요(+시온 사랑합니다)
