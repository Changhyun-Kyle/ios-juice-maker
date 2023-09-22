//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var fruitBox: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func getStockInfo(_ fruit: Fruit) throws -> Int {
        guard let stockCount = self.fruitBox[fruit] else {
            throw ErrorMessage.invalidInput
        }
        return stockCount
    }
}

extension FruitStore {
    public func calculateStock(_ consumeRecipe: [Fruit: Int]) -> Bool {
        for (fruit, needs) in consumeRecipe {
            guard let current = fruitBox[fruit] else  {
                return false
            }
            fruitBox[fruit] = current - needs
        }
        return true
    }
    
    public func stockManager(_ fruit: Int, changedStock: Double) {
        switch fruit {
        case 0:
            fruitBox[.strawberry] = Int(changedStock)
        case 1:
            fruitBox[.banana] = Int(changedStock)
        case 2:
            fruitBox[.pineapple] = Int(changedStock)
        case 3:
            fruitBox[.kiwi] = Int(changedStock)
        case 4:
            fruitBox[.mango] = Int(changedStock)
        default:
            break
        }
    }
}


