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
    
    // Bag을 자율적인 존재로 바꿔보자
    // Bag의 내부 상태에 접근하는 모든 로직을 Bag 안으로 캡슐화해서 결합도를 낮추면 된다
    func hold(ticket: Ticket) -> Float {
        if hasInvitation() {
            setTicket(ticket: ticket)
            return 0.0
        }else {
            minusAmount(amount: ticket.fee)
            setTicket(ticket: ticket)
            return ticket.fee
        }
    }
    
    // 아래 메소드들의 접근지정자를 private로 변경한다
    private func hasInvitation() -> Bool {
        return invitation != nil
    }
    
    private func hasTicket() -> Bool {
        return ticket != nil
    }
    
    private func setTicket(ticket: Ticket) {
        self.ticket = ticket
    }
    
    private func minusAmount(amount: Float) {
        self.amount -= amount
    }
    
    private func plusAmount(amount: Float) {
        self.amount += amount
    }
}

// 관람객
// 관람객은 소지품을 보관하기 위해 가방을 소지할 수 있다
class Audience {
    private var bag: Bag?
    
    init(bag: Bag) {
        self.bag = bag
    }
    
    // Audience의 캡슐화 개선하기
    // 변경된 코드에서 Audience는 자신의 가방 안에 초대장이 들어있는지를 스스로 확인한다 (이전에는 제 3자가 확인)
    func buy(ticket: Ticket) -> Float {
        return (bag?.hold(ticket: ticket))!
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
    // Audience가 Bag을 직접 처리하도록 변경하기 때문에 외부에서는 Audience가 Bag을 소유하고 있다는 사실을 알 필요가 없다
    func sellTo(audience: Audience) {
        ticketOffice?.plusAmount(amount: audience.buy(ticket: (ticketOffice?.getTicket())!))
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
