//
//  HistoryListItemView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import SwiftUI

struct HistoryListItemView: View {
    let transaction: Transaction
    let usersDateils: [String : User]
    
    @State private var editedTransaction = Transaction.emptyTransaction
    @State private var showTransactionModal = false
    
    var body: some View {
        Button {
            if (!showTransactionModal) {
                editedTransaction = transaction
            }
            showTransactionModal.toggle()
        } label: {
            HStack {
                HStack {
                    ZStack {
                        Image(usersDateils[transaction.userWhoPaid]!.avatar)
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
        .sheet(isPresented: $showTransactionModal) {
            NavigationStack {
                TransactionFormView(transaction: $editedTransaction)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showTransactionModal = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                showTransactionModal = false
                                editedTransaction = transaction
                            }
                        }
                    }
            }
        }
        
        .padding()
    }
}

#Preview {
    HistoryListItemView(
        transaction: TransactionsSummary.TransactionsSummaryMock.transactions[0],
        usersDateils: TransactionsSummary.TransactionsSummaryMock.usersDetails
    )
}
