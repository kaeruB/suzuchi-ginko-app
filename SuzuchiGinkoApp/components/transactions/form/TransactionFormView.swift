//
//  TransactionEditView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 11/08/2023.
//

import SwiftUI

struct TransactionFormView: View {
    @Binding var transaction: Transaction
    let usersDetails: [String : User]
    
//    TODO: set default value
//    init(transaction: Binding<Transaction>, usersDetails: [String : User]) {
//        self._transaction = transaction
//        self.usersDetails = usersDetails
//        
//        if (transaction.userWhoPaid.wrappedValue == "") {
//            print(usersDetails)
//            print(usersDetails.keys.first!)
//            
//            self._transaction.userWhoPaid.wrappedValue = usersDetails.keys.first!
//        }
//        
//        print(self._transaction.wrappedValue)
//    }
    
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
            }.padding(.leading)
            
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
                        
                        ForEach(Array(usersDetails.keys), id: \.self) { key in
                            if(key == transaction.userWhoPaid) {
                                Image(usersDetails[key]!.avatar)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 72)
                                    .overlay(RoundedRectangle(cornerRadius: 25)
                                        .stroke(lineWidth: 3)
                                        .opacity(0.5))
                                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            } else {
                                Image(usersDetails[key]!.avatar)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 72)
                                    .onTapGesture {
                                        transaction.userWhoPaid = key
                                    }
                            }
                        }
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
    TransactionFormView(
        transaction: .constant(Transaction.emptyTransaction),
        usersDetails: TransactionsSummary.TransactionsSummaryMock.usersDetails
    )
}
