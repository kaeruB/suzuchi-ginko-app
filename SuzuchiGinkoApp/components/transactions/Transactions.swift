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
    var parsedTransactionSummary: TransactionSummaryParsed
    
    init(pairId: String) {
        self.pairId = pairId
        
        // todo replace this with query
        let transactionSummaryData = provideTransactionsMock(pariId: pairId)
        
        parsedTransactionSummary = parseTransactionData(data: transactionSummaryData)
    }
    
    var body: some View {
        VStack {
            Summary(
                pairsSummary: parsedTransactionSummary.summary,
                pairId: pairId,
                usersDetails: parsedTransactionSummary.usersDetails
            )
                .padding(.bottom, 16)
            
            History(
                timestampToTransactionsMapping: parsedTransactionSummary.timestampToTransactionsMapping,
                usersDetails: parsedTransactionSummary.usersDetails
            )
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
