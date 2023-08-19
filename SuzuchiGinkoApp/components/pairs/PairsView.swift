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
    let pairsKeys: [String]
    
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
                        ForEach(0..<pairsKeys.count) { i in
                            NavigationLink(
                                destination: TransactionsView(pairId: pairsKeys[i])
                            ) {
                                SummaryView(
                                    pairsSummary: pairsSummaries[pairsKeys[i]]!,
                                    pairId: pairsKeys[i],
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
        pairsSummaries: PairsSummary.PairsSummaryMock.pairsSummaries,
        pairsKeys: [String](PairsSummary.PairsSummaryMock.pairsSummaries.keys)
    )
}
