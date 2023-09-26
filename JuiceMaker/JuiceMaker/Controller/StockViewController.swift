//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 전성수 on 2023/09/18.
//

import UIKit

protocol SendStockDelegate {
    func sendStock(data: JuiceMaker)
}

final class StockViewController: UIViewController{
    var delegate: SendStockDelegate?
    var injectedModel: JuiceMaker?
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        updateStockLabel()
        updateStepperValue()
    }
    
}

extension StockViewController {
    func injectModel(_ model: JuiceMaker) {
        injectedModel = model
    }
    
    private func updateStepperValue()  {
        guard let stock = injectedModel else {
            return
        }
        do {
            strawberryStepper.value = try stock.getStepperValue(.strawberry)
            bananaStepper.value = try stock.getStepperValue(.banana)
            pineappleStepper.value = try stock.getStepperValue(.pineapple)
            kiwiStepper.value = try stock.getStepperValue(.kiwi)
            mangoStepper.value = try stock.getStepperValue(.mango)
        } catch {
            print(error)
        }
    }
    
    private func updateStockLabel() {
        guard let stock = injectedModel else {
            return
        }
        do {
            strawberryLabel.text = try stock.getRemainingFruits(.strawberry)
            bananaLabel.text = try stock.getRemainingFruits(.banana)
            pineappleLabel.text = try  stock.getRemainingFruits(.pineapple)
            kiwiLabel.text = try stock.getRemainingFruits(.kiwi)
            mangoLabel.text = try stock.getRemainingFruits(.mango)
        } catch {
            statusAlert(ErrorMessage.invalidInput.debugDescription)
        }
    }
    
    private func statusAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension StockViewController {
    @IBAction func pressedStepper(_ sender: UIStepper) {
        guard let stock = injectedModel else {
            return
        }
        updateStepperValue()
        updateStockLabel()
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        guard let updatedModel = injectedModel else {
            return
        }
        delegate?.sendStock(data: updatedModel)
        self.navigationController?.popViewController(animated: true)
    }
}

