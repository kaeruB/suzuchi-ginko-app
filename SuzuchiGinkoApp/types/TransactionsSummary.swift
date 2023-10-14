//
//  TransactionsSummary.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import Foundation

enum Category: String, CaseIterable {
    case shopping = "Shopping"
    case home = "Home"
    case health = "Health"
    case entertainment = "Entertainment"
    case other = "Other"
}

enum CategoryIcon: String, CaseIterable {
    case shopping = "cart"
    case home = "house"
    case health = "pill"
    case entertainment = "face.smiling"
    case other = "questionmark"
}

struct Transaction: Identifiable {
    let id: UUID
    var pairId: String
    var amount: Double
    var amountAsString: String {
        get {
            String(amount)
        }
        set {
            amount = Double(newValue) ?? 0
        }
    }
    var userWhoPaid: String
    var category: Category
    var description: String
    var timestamp: TimeInterval
    var timestampAsDate: Date {
        get {
            let dateTimestamp = timestamp / 1000
            return Date(timeIntervalSince1970: TimeInterval(dateTimestamp))
        }
        
        set {
            timestamp = newValue.timeIntervalSince1970 * 1000
        }
    }
    
    init(id: UUID = UUID(), pairId: String, amount: Double, userWhoPaid: String, category: Category, description: String, timestamp: TimeInterval) {
        self.id = id
        self.pairId = pairId
        self.amount = amount
        self.userWhoPaid = userWhoPaid
        self.category = category
        self.description = description
        self.timestamp = timestamp
    }
}

struct User {
    var name: String
    var avatar: String
}

extension Transaction {
    static var emptyTransaction: Transaction {
        Transaction(
            pairId: "",
            amount: 0,
            userWhoPaid: "",
            category: Category.shopping,
            description: "",
            timestamp: NSDate().timeIntervalSince1970 * 1000
        )
    }
}

struct TransactionsSummary {
    var transactions: [Transaction]
    var totalTransactions: Int
    var summary: [String : Double]
    var usersDetails: [String : User]
}


struct TransactionSummaryParsed {
    var timestampToTransactionsMapping: [String: [Transaction]]
    var usersDetails: [String : User]
    var summary: [String : Double]
}
