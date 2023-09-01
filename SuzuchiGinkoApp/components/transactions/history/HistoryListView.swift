//
//  HistoryListView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 23/07/2023.
//

import SwiftUI

struct HistoryListView: View {
    let timestamp: String
    let transactions: [Transaction]
    let usersDetails: [String : User]
    
    var body: some View {
        VStack {
            Text("\(parseDateObjToDateString(timestamp: Double(timestamp)!))")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            VStack() {
                ForEach(transactions) { transaction in
                    HistoryListItemView(
                        transaction: transaction,
                        usersDetails: usersDetails
                    )
                }
            }
        }
    }
}

#Preview {
    HistoryListView(
        timestamp: String(TransactionsSummary.TransactionsSummaryMock.transactions[0].timestamp),
        transactions: TransactionsSummary.TransactionsSummaryMock.transactions,
        usersDetails: TransactionsSummary.TransactionsSummaryMock.usersDetails
    )
}
