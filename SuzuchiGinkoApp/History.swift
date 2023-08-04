//
//  History.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 23/07/2023.
//

import SwiftUI

struct History: View {
    var timestampToTransactionsMapping: [String: [Transaction]]
    var timestamps: [String]
    
    init() {
        timestampToTransactionsMapping = createTimestampToTransactionsMapping(transactions: TransactionsSummary.TransactionsSummaryMock.transactions)
        timestamps = [String](timestampToTransactionsMapping.keys).sorted(by: >)
    }
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<timestamps.count) { i in
                    HistoryList(
                        temporaryTimestamp: String(timestamps[i]),
                        transactions: timestampToTransactionsMapping[String(timestamps[i])]!
                    )
                }
                
            }
        }
    }
}

#Preview {
    History()
}
