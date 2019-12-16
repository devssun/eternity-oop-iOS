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
}

class MovieDatabase {
    /// 한 개의 영화 정보를 요청합니다
    func getMovieFromDB() -> Movie? {
        return nil
    }
    
    /// 오늘 상영 영화 리스트를 요청합니다
    func requestTodayMovieLists() -> [Movie]? {
        return nil
    }
}

class Movie {
    var name: String
    var openDate: Date
    
    init(name: String, openDate: Date) {
        self.name = name
        self.openDate = openDate
    }
}

//: [Next](@next)
