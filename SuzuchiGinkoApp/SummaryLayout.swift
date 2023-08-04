//
//  SummaryLayout.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import SwiftUI

struct SummaryLayout: View {
    @State var showTransactionsLayout = false
    
    var difference: String
    var personWithDebt: String
    var personWithoutDebt: String
    
    init() {
        let UserIds = [String](TransactionsSummary.TransactionsSummaryMock.usersDetails.keys)
        let moneyPayedByFirstUser: Double = TransactionsSummary.TransactionsSummaryMock.summary[UserIds[0]] ?? 0
        let moneyPayedBySecondUser: Double = TransactionsSummary.TransactionsSummaryMock.summary[UserIds[1]] ?? 0
        
        difference = String(format: "%.2f", abs(moneyPayedBySecondUser - moneyPayedByFirstUser))
        personWithDebt = moneyPayedByFirstUser < moneyPayedBySecondUser ? UserIds[0] : UserIds[1]
        personWithoutDebt = moneyPayedByFirstUser > moneyPayedBySecondUser ? UserIds[0] : UserIds[1]
    }
    
    
    var body: some View {
        Button {
            showTransactionsLayout.toggle()
        } label: {
        
            VStack {
                
                VStack {
                    HStack {
                        Image(TransactionsSummary.TransactionsSummaryMock.usersDetails[personWithDebt]!.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 64)
                        
                        Image(systemName: "yensign")
                            .foregroundColor(.black)
                            .font(.title2)
                        
                        Text("\(difference)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                        Image(TransactionsSummary.TransactionsSummaryMock.usersDetails[personWithoutDebt]!.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 64)
                            
                    }
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.black)
                        .padding(.top, -24)
               
                }
                
                Text("\(TransactionsSummary.TransactionsSummaryMock.usersDetails[personWithDebt]!.name) should return \(difference) yen to \(TransactionsSummary.TransactionsSummaryMock.usersDetails[personWithoutDebt]!.name)")
            }
        }
        .sheet(isPresented: $showTransactionsLayout, content: {
            Transactions()
        })
        .foregroundColor(.black)
    }
}

#Preview {
    SummaryLayout()
}
