//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 박병호 on 2021/10/21.
//
enum JuiceMenu {
    case strawberry
    case  banana
    case  kiwi
    case  pineapple
    case  mango
    case  strawberryBanana
    case  mangoKiwi
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case.kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .mango:
            return [.mango: 3]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .mango:
            return "망고"
        case .strawberryBanana:
            return "딸바"
        case .mangoKiwi:
            return "망키"
        }
    }
}
