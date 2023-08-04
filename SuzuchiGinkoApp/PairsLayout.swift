//
//  PairsLayout.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct PairsLayout: View {
    @State private var userId: String = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Create new dashboard")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            
            HStack {
                Text("Email")
                
                Spacer()
                
                TextField(
                    "Transaction description",
                    text: $userId
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
                
                Button {
                    //
                } label: {
                    Image(systemName: "person.badge.plus")
                }
                .font(.title3)
                .background(.gray)
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .cornerRadius(10)
            }
            .padding(.bottom, 40)
            
            SummaryLayout()
                .padding(.bottom, 40)
            SummaryLayout()
            
            Spacer()
            
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    PairsLayout()
}
