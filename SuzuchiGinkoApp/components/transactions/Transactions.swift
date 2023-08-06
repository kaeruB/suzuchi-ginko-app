//
//  Transactions.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct Transactions: View {
    
    let pairSummary: [String : Double]
    let pairId: String
    let usersDetails: [String : User]
    
    var body: some View {
        VStack {
            Summary(
                pairsSummary: pairSummary,
                pairId: pairId,
                usersDetails: usersDetails
            )
                .padding(.bottom, 16)
            
            History()
        }
    }
}

#Preview {
    Transactions(
        pairSummary: PairsSummary.PairsSummaryMock.pairsSummaries["userWithId1_userWithId2"]!,
        pairId: "userWithId1_userWithId2",
        usersDetails: PairsSummary.PairsSummaryMock.usersDetails
    )
}
