//
//  HistoryList.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 23/07/2023.
//

import SwiftUI

struct HistoryList: View {
    let timestamp: String
    let transactions: [Transaction]
    let usersDateils: [String : User]
    
    var body: some View {
        VStack {
            Text("\(parseDateObjToDateString(timestamp: Double(timestamp)!))")
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
        timestamp: String(TransactionsSummary.TransactionsSummaryMock.transactions[0].timestamp),
        transactions: TransactionsSummary.TransactionsSummaryMock.transactions,
        usersDateils: TransactionsSummary.TransactionsSummaryMock.usersDetails
    )
}
