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
    var ticketOffice: TicketOffice?
}

// 소극장
class Theater {
    var ticketSeller: TicketSeller?
    
    func enter(audience: Audience) {
        if (audience.bag?.hasInvitation())! {
            let ticket = ticketSeller?.ticketOffice?.getTicket()
            audience.bag?.setTicket(ticket: ticket!)
        }else {
            let ticket = ticketSeller?.ticketOffice?.getTicket()
            audience.bag?.minusAmount(amount: ticket!.fee)
            ticketSeller?.ticketOffice?.plusAmount(amount: ticket!.fee)
            audience.bag?.setTicket(ticket: ticket!)
        }
    }
}
