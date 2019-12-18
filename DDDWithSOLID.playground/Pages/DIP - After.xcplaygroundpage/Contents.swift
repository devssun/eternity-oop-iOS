//: [Previous](@previous)

import Foundation

// 의존관계를 독립시킬 인터페이스
protocol DependencyIndependentProtocol: AnyObject {
    var number: Int { get }
}

// 위 인터페이스에 의존관계가 있는 클래스
class AClass: DependencyIndependentProtocol {
    var number: Int = 1
}

// 의존성 주입
// AClass와 의존관계가 있는 BClass
class BClass {
    var internalVariable: DependencyIndependentProtocol
    
    init(externalVariable: DependencyIndependentProtocol) {
        self.internalVariable = externalVariable
    }
}

// 외부에서 AClass를 BClass에 주입합니다
let bClass = BClass(externalVariable: AClass())
print(bClass.internalVariable.number)

//: [Next](@next)
