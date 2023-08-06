//
//  History.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 23/07/2023.
//

import SwiftUI

struct History: View {
    let transactionsSummary: TransactionsSummary
    
    var timestampToTransactionsMapping: [String: [Transaction]]
    var timestamps: [String]
    
    init(transactionsSummary: TransactionsSummary) {
        self.transactionsSummary = transactionsSummary
        timestampToTransactionsMapping = createTimestampToTransactionsMapping(transactions: transactionsSummary.transactions)
        timestamps = [String](timestampToTransactionsMapping.keys).sorted(by: >)
    }
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<timestamps.count) { i in
                    HistoryList(
                        temporaryTimestamp: String(timestamps[i]),
                        transactions: timestampToTransactionsMapping[String(timestamps[i])]!,
                        usersDateils: transactionsSummary.usersDetails
                    )
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    History(transactionsSummary: TransactionsSummary.TransactionsSummaryMock)
}
