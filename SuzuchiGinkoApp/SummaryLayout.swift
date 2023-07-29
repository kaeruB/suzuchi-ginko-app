//
//  SummaryLayout.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import SwiftUI

struct SummaryLayout: View {
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
        VStack {
            
            VStack {
                HStack {
                    Image(TransactionsSummary.TransactionsSummaryMock.usersDetails[personWithDebt]!.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 64)
                    
                    Text("\(difference) YEN")
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
            
            Text("\(TransactionsSummary.TransactionsSummaryMock.usersDetails[personWithDebt]!.name) should return \(difference) to \(TransactionsSummary.TransactionsSummaryMock.usersDetails[personWithoutDebt]!.name)")
        }
    }
}

#Preview {
    SummaryLayout()
}
