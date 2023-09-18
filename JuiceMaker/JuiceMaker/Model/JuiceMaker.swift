//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    // MARK: - Properties
    
    private let fruitStore = FruitStore()
    

    // MARK: - Methods
    
    func makeJuice(menu: JuiceMenu) throws {
        let recipe = menu.juiceRecipe()
        
        for (fruit, count) in recipe {
            let remainCount = try checkFruit(fruit: fruit)
            
            if remainCount < count {
                throw StockError.emptyStock
            }
            fruitStore.consume(fruit: fruit, count: count)
        }
    }
    
    func checkFruit(fruit: Fruit) throws -> Int {
        return try fruitStore.checkFruitStock(fruit: fruit)
    }
}
