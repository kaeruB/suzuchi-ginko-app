//
//  TransactionsSummaryMock.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import Foundation

extension TransactionsSummary {
    static let TransactionsSummaryMock = TransactionsSummary(
        transactions: [
            Transaction(
                pairId: "userWithId1_userWithId2",
                amount: 30240,
                userWhoPaid: "userWithId1",
                category: Category.Shopping,
                description: "Hotel Nagano",
                timestamp: 1695168000000
            ),
            Transaction(
                pairId: "userWithId1_userWithId2",
                amount: 27800,
                userWhoPaid: "userWithId1",
                category: Category.Shopping,
                description: "Hotel Tokio",
                timestamp: 1694649600000
            ),
            Transaction(
                pairId: "userWithId1_userWithId2",
                amount: 10170,
                userWhoPaid: "userWithId1",
                category: Category.Shopping,
                description: "spring japan TokioNarita -> Hiroshima",
                timestamp: 1689379200000
            ),
            Transaction(
                pairId: "userWithId1_userWithId2",
                amount: 16187,
                userWhoPaid: "userWithId1",
                category: Category.Shopping,
                description: "Hotel Hiroshima",
                timestamp: 1689379200000
            ),
            Transaction(
                pairId: "userWithId1_userWithId2",
                amount: 6502.5,
                userWhoPaid: "userWithId1",
                category: Category.Shopping,
                description: "Hotel Nagoya",
                timestamp: 1689379200000
            ),
            Transaction(
                pairId: "userWithId1_userWithId2",
                amount: 18850,
                userWhoPaid: "userWithId1",
                category: Category.Shopping,
                description: "peach Sapporo -> Narita",
                timestamp: 1688860800000
            ),
            Transaction(
                pairId: "userWithId1_userWithId2",
                amount: 7350,
                userWhoPaid: "userWithId1",
                category: Category.Shopping,
                description: "peach Narita -> Sapporo",
                timestamp: 1688688000000
            )
        ],
        totalTransactions: 7,
        summary: [
            "userWithId1": 117099.5,
            "userWithId2": 0
        ],
        usersDetails: [
            "userWithId1": User(name: "User1", avatar: "avatar1"),
            "userWithId2": User(name: "User2", avatar: "avatar6"),
        ]
    )
}
