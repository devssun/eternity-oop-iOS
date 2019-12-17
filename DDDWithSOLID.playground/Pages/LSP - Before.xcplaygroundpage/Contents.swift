//: [Previous](@previous)

import Foundation

class 직사각형 {
    var height: Int = 0
    var width: Int = 0
    var area: Int {
        return height * width
    }
}

class 정사각형: 직사각형 {
    override var height: Int {
        didSet {
            width = height
        }
    }
}

func printArea(of rectangle: 직사각형) {
    rectangle.width = 2
    rectangle.height = 5
    print(rectangle.area)
}

let rectangle = 직사각형()
printArea(of: rectangle)

let square = 정사각형()
printArea(of: square)


//: [Next](@next)
