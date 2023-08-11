//
//  Transactions.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct Transactions: View {
    @State private var isPresentingNewTransactionView = false
    
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
            Button(action: {
                isPresentingNewTransactionView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Transaction")
        }
        .sheet(isPresented: $isPresentingNewTransactionView) {
            NavigationStack {
                NewTransactionView()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingNewTransactionView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                isPresentingNewTransactionView = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    Transactions(
        pairId: "userWithId1_userWithId2"
    )
}
