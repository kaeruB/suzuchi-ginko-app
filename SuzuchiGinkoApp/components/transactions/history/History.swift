//
//  History.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 23/07/2023.
//

import SwiftUI

struct History: View {
    let timestampToTransactionsMapping: [String: [Transaction]]
    let usersDetails: [String: User]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(Array(timestampToTransactionsMapping.keys.sorted(by: >)), id: \.self) { key in
                    HistoryList(
                        timestamp: key,
                        transactions: timestampToTransactionsMapping[key]!,
                        usersDateils: usersDetails
                    )
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    History(
        timestampToTransactionsMapping: TransactionSummaryParsed.ParsedData.timestampToTransactionsMapping,
        usersDetails: TransactionSummaryParsed.ParsedData.usersDetails
    )
}
