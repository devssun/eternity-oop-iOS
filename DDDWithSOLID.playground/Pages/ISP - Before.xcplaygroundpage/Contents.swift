//: [Previous](@previous)

import Foundation

protocol Bank {
    func makeAccount(money: Double)
    func withDraw(value: Double)
    func transferMoney(value: Double)
}

class ATM: Bank {
    func makeAccount(money: Double) {
        // ❌
    }
    
    func withDraw(value: Double) {
        // ⭕️
    }
    
    func transferMoney(value: Double) {
        // ⭕️
    }
}

class OnlineBanking: Bank {
    func makeAccount(money: Double) {
        // ⭕️
    }
    
    func withDraw(value: Double) {
        // ⭕️
    }
    
    func transferMoney(value: Double) {
        // ⭕️
    }
}

//: [Next](@next)
