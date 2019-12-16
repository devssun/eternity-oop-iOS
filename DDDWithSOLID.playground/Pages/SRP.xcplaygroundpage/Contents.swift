//: [Previous](@previous)

// SRP Example

import Foundation

class Theater {
    /// 극장 이름
    var name: String
    /// 극장 주소
    var address: String
    /// 극장 전화번호
    var phoneNumber: String
    
    /// 극장 정보 초기화
    init(name: String, address: String, phoneNumber: String) {
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
    }
    
    /// 오늘 상영 영화 리스트를 요청합니다
    func requestTodayMovieLists() -> [Any] {
        return ["LISTS"]
    }
    
    /// 영화 정보를 생성합니다
    func createMovie() {
    }
    
    /// 한 개의 영화 정보를 요청합니다
    func getMovieFromDB() -> Any {
        return "MOVIE"
    }
}

//: [Next](@next)
