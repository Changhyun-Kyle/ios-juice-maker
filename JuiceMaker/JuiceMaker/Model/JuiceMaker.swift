//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore.shared

    func order(juice: Menu) {
        do {
            try make(juice: juice)
        } catch {
            print(error.localizedDescription)
        }
    }

    private func make(juice order: Menu) throws {
        try order.recipe.forEach { (fruit, quantity) in
            try fruitStore.remove(fruit: fruit, quantity: quantity)
        }
    }
}
