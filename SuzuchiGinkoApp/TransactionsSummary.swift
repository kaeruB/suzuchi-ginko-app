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

struct Transaction {
    var pairId: String
    var amount: Double
    var userWhoPaid: String
    var category: Category
    var description: String
    var timestamp: Int
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

