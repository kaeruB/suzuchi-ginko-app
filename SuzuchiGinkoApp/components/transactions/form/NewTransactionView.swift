//
//  TransactionEditView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 11/08/2023.
//

import SwiftUI

struct NewTransactionView: View {
    @State private var transaction = Transaction.emptyTransaction

    
    var body: some View {
        Form {
            Section(header: Text("New transaction")){
            
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
                
                TextField("Memo", text: $transaction.description)
            }
        }
    }
}

#Preview {
    NewTransactionView()
}
