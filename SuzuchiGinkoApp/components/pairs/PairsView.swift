//
//  PairsView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct PairsView: View {
    @State private var userId: String = ""
    
    let pairsSummaries: [String: [String : Double]]
    
    var body: some View {
        NavigationStack {
            VStack {
                
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
                .padding(.bottom, 30)
                
                
                VStack(spacing: 40) {
                    ForEach(Array(pairsSummaries.keys), id: \.self) {
                        key in
                        NavigationLink(
                            destination: TransactionsView(pairId: key)
                        ) {
                            SummaryView(
                                pairsSummary: pairsSummaries[key]!,
                                pairId: key,
                                usersDetails: PairsSummary.PairsSummaryMock.usersDetails
                            )
                        }
                    }
                }
            }
            .navigationTitle("Dashboard")
            .navigationBarHidden(true)
            
            Spacer()
        }

        
    }
}

#Preview {
    PairsView(
        pairsSummaries: PairsSummary.PairsSummaryMock.pairsSummaries
    )
}
