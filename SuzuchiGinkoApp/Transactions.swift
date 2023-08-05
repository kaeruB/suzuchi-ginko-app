//
//  Transactions.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct Transactions: View {
    var body: some View {
        VStack {
            SummaryLayout(
                pairsSummary: PairsSummary.PairsSummaryMock.pairsSummaries["userWithId1_userWithId2"]!,
                pairId: "userWithId1_userWithId2",
                usersDetails: PairsSummary.PairsSummaryMock.usersDetails
            )
                .padding(.bottom, 48)
                .padding(.top, 48)
            
            History()
            
        }
        .padding()
    }
}

#Preview {
    Transactions()
}
