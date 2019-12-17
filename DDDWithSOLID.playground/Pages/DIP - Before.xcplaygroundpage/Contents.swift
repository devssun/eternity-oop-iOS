//: [Previous](@previous)

import Foundation

// 평범한 클래스
class AClass {
    var number: Int = 1
}

// AClass와 의존관계가 있는 클래스
class BClass {
    // BClass 내부 변수로 AClass를 사용할 것
    // BClass에서 AClass를 내부 변수로 사용
    var aclass = AClass()
}

let bClass = BClass()
print(bClass.aclass.number)

//: [Next](@next)
