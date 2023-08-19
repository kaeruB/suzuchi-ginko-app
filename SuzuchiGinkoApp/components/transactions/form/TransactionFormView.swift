//
//  TransactionEditView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 11/08/2023.
//

import SwiftUI

struct TransactionFormView: View {
    @Binding var transaction: Transaction
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    //
                } label: {
                    Text("Delete")
                    Image(systemName: "trash")
                }
                .font(.title3)
                .background(.red)
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .cornerRadius(10)
                
                Spacer()
                
                
            }
            
            Form {
                Section(header: Text("Amount")){
                    
                    HStack {
                        TextField("Amount", text: $transaction.amountAsString)
                        
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            Text("Split")
                            Image(systemName: "divide")
                        }
                        .font(.title3)
                        .background(.gray)
                        .foregroundColor(.white)
                        .buttonStyle(.bordered)
                        .cornerRadius(10)
                    }
                    
                    
                    HStack {
                        Text("Paid by")
                        Spacer()
                        
                        // todo user id
                        Image(TransactionsSummary.TransactionsSummaryMock.usersDetails["userWithId1"]!.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 72)
                        
                        
                        Image(TransactionsSummary.TransactionsSummaryMock.usersDetails["userWithId2"]!.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 72)
                    }
                }
                Section(header: Text("Details")){
                    
                    DatePicker(
                            "Date",
                            selection: $transaction.timestampAsDate,
                            displayedComponents: [.date]
                        )
                    
                    
                        HStack {
                            Text("Category")
                            
                            Spacer()
                            
                            Image(systemName: "cart")
                                .font(.title)
                    
                            Image(systemName: "house")
                                .font(.title)
                    
                            Image(systemName: "pill")
                                .font(.title)
                    
                            Image(systemName: "face.smiling")
                                .font(.title)
                    
                            Image(systemName: "questionmark")
                                .font(.title)
                    
                        }
                    
                    
                    TextField("Memo", text: $transaction.description)
                }
            }
        }
    }
}

#Preview {
    TransactionFormView(transaction: .constant(Transaction.emptyTransaction))
}
