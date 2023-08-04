//
//  PairsSummaryMock.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 05/08/2023.
//

import Foundation

extension PairsSummary {
    static let PairsSummaryMock = PairsSummary(
        pairsSummaries: [
            "userWithId1_userWithId2": [
                "userWithId1": 117099.5,
                "userWithId2": 0
            ],
            "userWithId1_userWithId3": [
                "userWithId1": 200,
                "userWithId3": 10
            ]
        ],
        usersDetails: [
            "userWithId1": User(name: "User1", avatar: "avatar1"),
            "userWithId2": User(name: "User2", avatar: "avatar6"),
            "userWithId3": User(name: "User3", avatar: "avatar2"),
        ]
    )
}
