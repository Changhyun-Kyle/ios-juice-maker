//
//  JuiceMaker - ViewController.swift
//  Created by Kyle& L
//

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var manageFruitButton: UIBarButtonItem!
    var fruitStore: FruitStore = FruitStore(strawberryStock: 10,
                                            bananaStock: 10,
                                            pineappleStock: 10,
                                            kiwiStock: 10,
                                            mangoStock: 10)
    lazy var juiceMaker: JuiceMaker = JuiceMaker(fruitStore: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setStockLabelUI()
    }
    
    private func configureUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "재고수정",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(showFruitStoreViewController))
    }
    
    private func setStockLabelUI() {
        guard
            let strawberryStock = fruitStore.fruitStocks[.strawberry],
            let bananaStock = fruitStore.fruitStocks[.banana],
            let pineappleStock = fruitStore.fruitStocks[.pineapple],
            let kiwiStock = fruitStore.fruitStocks[.kiwi],
            let mangoStock = fruitStore.fruitStocks[.mango]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
    
    private func startJuiceMakerProcess(juice: Juice) throws {
        try juiceMaker.checkUnderstockedFruits(juice: juice)
        juiceMaker.makeJuice(juice: juice)
        showJuiceMakerAlert(isCompletedMakeJuice: true,
                            message: "\(juice.name) 나왔습니다! 맛있게 드세요!",
                            completion: nil)
    }

    @objc
    func showFruitStoreViewController() {
        guard
            let fruitStoreViewController = storyboard?.instantiateViewController(identifier: "FruitStoreViewController", creator: { coder in
                return FruitStoreViewController(fruitStore: self.fruitStore, coder: coder)
            })
        else {
            fatalError("init(coder:) has not been implemented")
        }
        fruitStoreViewController.delegate = self
        self.navigationController?.pushViewController(fruitStoreViewController, animated: true)
    }
    
    private func proceedMakingJuice(juice: Juice, labels: [UILabel]) {
        do {
            try startJuiceMakerProcess(juice: juice)
            let sortedJuiceRecipe = juice.recipe.sorted(by: { $0.value > $1.value })
            for (index, ingredient) in sortedJuiceRecipe.enumerated() {
                guard
                    let remainStock = fruitStore.fruitStocks[ingredient.key]
                else {
                    return
                }
                guard index < labels.count else { return }
                labels[index].text = String(remainStock)
            }
        } catch {
            showJuiceMakerAlert(isCompletedMakeJuice: false,
                                message: error.localizedDescription,
                                completion: { [weak self] in
                print("핸들러 시작")
                self?.showFruitStoreViewController()
                print("핸들러 종료")
            })
            print("catch문 끝")
        }
        print("proceedMakingJuice 함수 끝")
    }
    
    @IBAction private func tappedStrawberryBananaJuiceButton(_ sender: UIButton) {
        proceedMakingJuice(juice: .strawberryBananaJuice, labels: [strawberryStockLabel, bananaStockLabel])
    }
    
    @IBAction private func tappedMangoKiwiJuiceButton(_ sender: UIButton) {
        proceedMakingJuice(juice: .mangoKiwiJuice, labels: [mangoStockLabel, kiwiStockLabel])
    }
    
    @IBAction private func tappedStrawberryJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .strawberryJuice, labels: [strawberryStockLabel])
    }
    
    @IBAction private func tappedBananaJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .bananaJuice, labels: [bananaStockLabel])
    }
    
    @IBAction private func tappedPineappleJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .pineappleJuice, labels: [pineappleStockLabel])
    }
    
    @IBAction private func tappedKiwiJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .kiwiJuice, labels: [kiwiStockLabel])
    }
    
    @IBAction private func tappedMangoJuiceButtonTapped(_ sender: UIButton) {
        proceedMakingJuice(juice: .mangoJuice, labels: [mangoStockLabel])
    }
}

extension JuiceMakerViewController: FruitStockDelegate, JuiceMakerAlert {
    func updateFruitStock() {
        setStockLabelUI()
    }
}
