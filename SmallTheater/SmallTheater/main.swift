//
//  main.swift
//  SmallTheater
//
//  Created by 최혜선 on 2019/12/04.
//  Copyright © 2019 jamie. All rights reserved.
//

import Foundation

// 이벤트 당첨자에게 발송되는 초대장
class Invitation {
    var when: Date?
}

// 공연을 관람하기 원하는 모든 사람들은 티켓을 소지하고 있어야만 한다
class Ticket {
    var fee: Float = 0.0
}

// 관람객은 소지품을 보관할 용도로 가방을 들고 올 수 있다
class Bag {
    var amount: Float = 0.0
    var invitation: Invitation?
    var ticket: Ticket?
    
    init(amount: Float) {
        self.amount = amount
    }
    
    init(invitation: Invitation, amount: Float) {
        self.invitation = invitation
        self.amount = amount
    }
    
    func hasInvitation() -> Bool {
        return invitation != nil
    }
    
    func hasTicket() -> Bool {
        return ticket != nil
    }
    
    func setTicket(ticket: Ticket) {
        self.ticket = ticket
    }
    
    func minusAmount(amount: Float) {
        self.amount -= amount
    }
    
    func plusAmount(amount: Float) {
        self.amount += amount
    }
}

// 관람객
// 관람객은 소지품을 보관하기 위해 가방을 소지할 수 있다
class Audience {
    var bag: Bag?
    
    init(bag: Bag) {
        self.bag = bag
    }
}

// 매표소
class TicketOffice {
    var amount: Float = 0.0
    var tickets: [Ticket]?
    
    init(amount: Float, tickets: [Ticket]) {
        self.amount = amount
        self.tickets = tickets
    }
    
    func getTicket() -> Ticket {
        return (tickets?.remove(at: 0))!
    }
    
    func minusAmount(amount: Float) {
        self.amount -= amount
    }
    
    func plusAmount(amount: Float) {
        self.amount += amount
    }
}

// 판매원
class TicketSeller {
    // 외부에서 ticketOffice에 접근할 수 없도록 private 접근지정자를 부여한다
    private var ticketOffice: TicketOffice?
    
    // TicketSeller가 직접 Bag과 TicketOffice를 처리하는 자율적인 존재가 되도록 설계를 변경한다
    func sellTo(audience: Audience) {
        if (audience.bag?.hasInvitation())! {
            let ticket = ticketOffice?.getTicket()
            audience.bag?.setTicket(ticket: ticket!)
        }else {
            let ticket = ticketOffice?.getTicket()
            audience.bag?.minusAmount(amount: ticket!.fee)
            ticketOffice?.plusAmount(amount: ticket!.fee)
            audience.bag?.setTicket(ticket: ticket!)
        }
    }
}

// 소극장
class Theater {
    var ticketSeller: TicketSeller?
    
    // Theater가 Bag과 TicketSeller에 관해 속속들이 알고 있을 필요는 없다
    // 관람객이 소극장에 입장하는 것이 Theater가 바라는 일!
    // Theater의 enter 메소드는 TicketSeller의 sellTo 메소드를 호출하기만 할 뿐, TicketOffice의 정체는 알지 못한다
    func enter(audience: Audience) {
        ticketSeller?.sellTo(audience: audience)
    }
}
