//
//  TransactionEditModal.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct TransactionEditForm: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var description: String = ""
    @State private var date = Date()
//    @FocusState private var emailFieldIsFocused: Bool = false
    
    let transaction: Transaction
    let usersDateils: [String : User]
    
    var body: some View {
        VStack {
            HStack {
                Text("Edit transaction")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                }
                .foregroundColor(.black)
                
            }.padding(.bottom, 20)
            
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
            }.padding(.bottom, 40)
            
            VStack {
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
                .padding(.bottom, 40)
                
                HStack {
                    Text("Amount")
                    
                    Spacer()
                    
                    Image(systemName: "yensign")
                    Text("3,300")
                    
                    
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
                .padding(.bottom, 40)
                
                
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
                .padding(.bottom, 40)
                
                HStack {
                    Text("Memo")
                    
                    Spacer()
                    
                    TextField(
                            "Transaction description",
                            text: $description
                        )
//                        .focused($emailFieldIsFocused)
                        .onSubmit {
//                            validate(name: description)
                        }
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.secondary)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 8)
                    


//                        Text(description)
//                            .foregroundColor(emailFieldIsFocused ? .red : .blue)
                }
                .padding(.bottom, 40)
                
                HStack {
                    DatePicker(
                            "Date",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                }
                .padding(.bottom, 40)
                
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .font(.largeTitle)
                .background(.gray)
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                
            }
        }.padding()
        
       
    }
}

#Preview {
    TransactionEditForm(
        transaction: TransactionsSummary.TransactionsSummaryMock.transactions[0],
        usersDateils: TransactionsSummary.TransactionsSummaryMock.usersDetails
    )
}
