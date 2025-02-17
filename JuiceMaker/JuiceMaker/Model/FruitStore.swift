//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var inventory: [Fruit: Int] = [:]
    
    init(fruitQuantity: Int = 10) {
        Fruit.allCases.forEach { fruit in
            inventory.updateValue(fruitQuantity, forKey: fruit)
        }
    }
    
    init(inventory: [Fruit: Int]) {
        self.inventory = inventory
    }
}

extension FruitStore: FruitStockManaging {
    func checkFruitStock(of fruit: Fruit, by quantity: Int) throws -> Bool {
        guard let fruitStock = inventory[fruit] else {
            throw FruitStoreError.stockDataMissing
        }
        return fruitStock >= quantity
    }
    
    func changeFruitStock(of fruit: Fruit, by quantity: Int = 1, calculate: (Int, Int) -> Int) throws {
        guard let fruitStock = inventory[fruit] else {
            throw FruitStoreError.stockDataMissing
        }
        let changedFruitStock = calculate(fruitStock, quantity)
        if changedFruitStock < 0 {
            throw FruitStoreError.stockShortage
        }
        inventory[fruit] = changedFruitStock
        NotificationCenter.default.post(name: .FruitStockChanged, object: fruit)
    }
    
    func currentFruitStock(of fruit: Fruit) throws -> Int {
        guard let currentStock = inventory[fruit] else {
            throw FruitStoreError.stockDataMissing
        }
        return currentStock
    }
}
