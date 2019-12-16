//
//  main.swift
//  ReservationMovie
//
//  Created by 최혜선 on 2019/12/05.
//  Copyright © 2019 jamie. All rights reserved.
//

import Foundation

class Screening {
    private var movie: Movie?
    private var sequence: Int = 0
    private var whenScreened: Date?
    
    init(movie: Movie, sequence: Int, whenScreened: Date) {
        self.movie = movie
        self.sequence = sequence
        self.whenScreened = whenScreened
    }
    
    func getStartTime() -> Date {
        return whenScreened!
    }
    
    func isSequence(sequence: Int) -> Bool {
        return self.sequence == sequence
    }
    
    func getMovieFee() -> Money {
        return movie.getFee()
    }
}

class Movie {
    
}

class Money {
    static var zero: Money = Money.wons(0.0)
    private final var amount: Decimal?
    
    init(amount: Decimal) {
        self.amount = amount
    }
    
    func wons(amount: Double) -> Money {
        return Money(amount: Decimal.init(amount))
    }
    
    func plus(amount: Money) -> Money {
        return Money(amount: self.amount! + amount.amount!)
    }
    
    func minus(amount: Money) -> Money {
        return Money(amount: self.amount! - amount.amount!)
    }
    
    func times(percent: Money) -> Money {
        return Money(amount: self.amount! * percent.amount!)
    }
    
    func isLessThan(other: Money) -> Bool {
        return true
    }
}

class Screening {
    func reserve(customer: Customer, audienceCount) -> Reservation {
        <#function body#>
    }
}

class Reservation {
    
}

class DiscountPolicy {
    
}

class AmountDoscountPolicy {
    
}

class PercentDiscountPolicy {
    
}

class DiscountCondition {
    
}

class SequenceCondition {
    
}

class PeriodCondition {
    
}
