//
//  HistoryList.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 23/07/2023.
//

import SwiftUI

struct HistoryList: View {
    let temporaryTimestamp: String
    let transactions: [Transaction]
    let usersDateils: [String : User]
    
    var body: some View {
        VStack {
            Text("\(parseDateObjToDateString(timestamp: Double(temporaryTimestamp)!))")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            VStack() {
                ForEach(transactions) { transaction in
                    HistoryListItem(
                        transaction: transaction,
                        usersDateils: usersDateils
                    )
                }
            }
        }
    }
}

#Preview {
    HistoryList(
        temporaryTimestamp: String(TransactionsSummary.TransactionsSummaryMock.transactions[0].timestamp),
        transactions: TransactionsSummary.TransactionsSummaryMock.transactions,
        usersDateils: TransactionsSummary.TransactionsSummaryMock.usersDetails
    )
}
