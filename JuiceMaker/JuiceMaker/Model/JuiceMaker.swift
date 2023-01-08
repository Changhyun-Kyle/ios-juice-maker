//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func make(juiceName: FruitJuice) {
        guard isEnoughFruit(of: juiceName) else {
            print(InfoMessage.noStock.rawValue)
            return
        }
        
        bringFruit(for: juiceName)
    }
    
    private func isEnoughFruit(of juiceName: FruitJuice) -> Bool {
        for (fruit, neededNumber) in juiceName.recipe {
            guard let currentStock = fruitStore.fruitStock[fruit] else { return false }
            guard currentStock >= neededNumber else { return false }
        }
        return true
    }
    
    private func bringFruit(for juiceName: FruitJuice) {
        for (fruit, neededNumber) in juiceName.recipe {
            fruitStore.consumeStock(for: fruit, number: neededNumber)
        }
    }
}
