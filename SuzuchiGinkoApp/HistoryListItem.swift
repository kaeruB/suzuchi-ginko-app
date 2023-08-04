//
//  HistoryListItem.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import SwiftUI

struct HistoryListItem: View {
    @State var showTransactionModal = false
    
    let transaction: Transaction
    
    var body: some View {
        Button {
            showTransactionModal.toggle()
        } label: {
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
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Image(systemName: "yensign")
                    .foregroundColor(.black)
                Text(String(transaction.amount))
                    .bold()
                    .foregroundColor(.black)
            }
        }
        .sheet(isPresented: $showTransactionModal, content: {
            TransactionEditModal()
        })
        .padding()
    }
}

#Preview {
    HistoryListItem(transaction: TransactionsSummary.TransactionsSummaryMock.transactions[0])
}
