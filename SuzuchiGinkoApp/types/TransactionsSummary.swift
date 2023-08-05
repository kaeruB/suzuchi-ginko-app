//
//  TransactionsSummary.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import Foundation

enum Category: String, CaseIterable {
    case Shopping = "Shopping"
}

struct Transaction: Identifiable {
    let id: UUID
    var pairId: String
    var amount: Double
    var userWhoPaid: String
    var category: Category
    var description: String
    var timestamp: Int
    
    init(id: UUID = UUID(), pairId: String, amount: Double, userWhoPaid: String, category: Category, description: String, timestamp: Int) {
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

struct TransactionsSummary {
    var transactions: [Transaction]
    var totalTransactions: Int
    var summary: [String : Double]
    var usersDetails: [String : User]
}