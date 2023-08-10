//
//  Transactions.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct Transactions: View {
    let pairId: String
    var transactionsSummary: TransactionsSummary
    
    init(pairId: String) {
        self.pairId = pairId
        
        // todo replace this with query
        transactionsSummary = provideTransactionsMock(pariId: pairId)
    }
    
    var body: some View {
        VStack {
            Summary(
                pairsSummary: transactionsSummary.summary,
                pairId: pairId,
                usersDetails: transactionsSummary.usersDetails
            )
                .padding(.bottom, 16)
            
            History(transactionsSummary: transactionsSummary)
        }
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Transaction")
        }
    }
}

#Preview {
    Transactions(
        pairId: "userWithId1_userWithId2"
    )
}
