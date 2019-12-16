//: [Previous](@previous)

import Foundation

enum Contry: String {
    case korea = "한국"
    case us = "미국"
    case russia = "러시아"
    
    var name: String {
        return rawValue
    }
    
    var flag: String {
        switch self {
        case .korea:
            return "🇰🇷"
        case .us:
            return "🇺🇸"
        case .russia:
            return "🇷🇺"
        }
    }
}

class Flag {
    let contry: Contry
    
    init(contry: Contry) {
        self.contry = contry
    }
}

func printNameOfContry(contry: Contry) {
    print(contry.name)
}

func printFlagOfContry(contry: Contry) {
    print(contry.flag)
}

func actionByContry(contry: Contry) {
    switch contry {
    case .korea:
        print("국내여행")
    case .us:
        print("미국여행")
    case .russia:
        print("러시아여행")
    }
}

printFlagOfContry(contry: Contry.korea)
//: [Next](@next)
