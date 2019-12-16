//: [Previous](@previous)

import Foundation

protocol Contry {
    var name: String { get }
    var flag: String { get }
    func action()
}

struct Korea: Contry {
    let name: String = "한국"
    let flag: String = "🇰🇷"
    func action() {
        print("한국여행")
    }
}

struct US: Contry {
    let name: String = "미국"
    let flag: String = "🇺🇸"
    func action() {
        print("미국여행")
    }
}

struct Russia: Contry {
    let name: String = "러시아"
    let flag: String = "🇷🇺"
    func action() {
        print("러시아여행")
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
    contry.action()
}

printFlagOfContry(contry: Korea())
actionByContry(contry: Russia())
//: [Next](@next)
