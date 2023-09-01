//
//  HistoryView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 23/07/2023.
//

import SwiftUI

struct HistoryView: View {
    let timestampToTransactionsMapping: [String: [Transaction]]
    let usersDetails: [String: User]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(Array(timestampToTransactionsMapping.keys.sorted(by: >)), id: \.self) { key in
                    HistoryListView(
                        timestamp: key,
                        transactions: timestampToTransactionsMapping[key]!,
                        usersDetails: usersDetails
                    )
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HistoryView(
        timestampToTransactionsMapping: TransactionSummaryParsed.ParsedData.timestampToTransactionsMapping,
        usersDetails: TransactionSummaryParsed.ParsedData.usersDetails
    )
}
