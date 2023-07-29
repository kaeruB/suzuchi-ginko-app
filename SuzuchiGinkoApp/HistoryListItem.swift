//
//  HistoryListItem.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Bogacz on 22/07/2023.
//

import SwiftUI

struct HistoryListItem: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            HStack {
                ZStack {
                    Image(TransactionsSummary.TransactionsSummaryMock.usersDetails[
                        TransactionsSummary.TransactionsSummaryMock.transactions[0].userWhoPaid
                    ]!.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    
                    Image(systemName: "car")
                        .foregroundColor(.black)
                        .offset(x: 15, y: 15)
                    
                }
                
                Text(transaction.description)
                    .font(.body)
            }
            
            Spacer()
            
            Text(String(transaction.amount))
                .bold()
        }.padding()
    }
}

#Preview {
    HistoryListItem(transaction: TransactionsSummary.TransactionsSummaryMock.transactions[0])
}
