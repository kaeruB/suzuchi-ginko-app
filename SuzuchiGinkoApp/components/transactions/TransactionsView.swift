//
//  TransactionsView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct TransactionsView: View {
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
            SummaryView(
                pairsSummary: parsedTransactionSummary.summary,
                pairId: pairId,
                usersDetails: parsedTransactionSummary.usersDetails
            )
                .padding(.bottom, 16)
            
            HistoryView(
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
                TransactionFormView(transaction: .constant(Transaction.emptyTransaction))
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
    TransactionsView(
        pairId: "userWithId1_userWithId2"
    )
}
