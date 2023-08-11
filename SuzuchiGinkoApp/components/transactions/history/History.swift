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
    
    init(transactionsSummary: TransactionsSummary) {
        self.transactionsSummary = transactionsSummary
        timestampToTransactionsMapping = createTimestampToTransactionsMapping(transactions: transactionsSummary.transactions)
    }
     
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(Array(timestampToTransactionsMapping.keys.sorted(by: >)), id: \.self) { key in
                    HistoryList(
                        temporaryTimestamp: key,
                        transactions: timestampToTransactionsMapping[key]!,
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
