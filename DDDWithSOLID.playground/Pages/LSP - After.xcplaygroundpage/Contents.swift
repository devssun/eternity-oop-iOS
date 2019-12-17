//: [Previous](@previous)

import Foundation

protocol 사각형 {
    var area: Int { get }
}

class 직사각형: 사각형 {
    private let height: Int
    private let width: Int
    
    init(height: Int, width: Int) {
        self.height = height
        self.width = width
    }
    
    var area: Int {
        return height * width
    }
}

class 정사각형: 사각형 {
    private let length: Int
    
    init(length: Int) {
        self.length = length
    }
    
    var area: Int {
        return length * length
    }
}

let sqaure = 정사각형(length: 5)
print(sqaure.area)

let rectangle = 직사각형(height: 6, width: 3)
print(rectangle.area)
//: [Next](@next)
