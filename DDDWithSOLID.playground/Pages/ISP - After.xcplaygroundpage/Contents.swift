//: [Previous](@previous)

import Foundation

protocol BankProcess {
    func withDraw(value: Double)
    func transferMoney(value: Double)
}

protocol OnlineProcess {
    func makeAccount(money: Double)
}

class ATM: BankProcess {
    func withDraw(value: Double) {
        // ⭕️
    }
    
    func transferMoney(value: Double) {
        // ⭕️
    }
}

class OnlineBanking: BankProcess, OnlineProcess {
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
