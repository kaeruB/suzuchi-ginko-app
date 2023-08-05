//
//  SummaryLayout.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import SwiftUI

struct Summary: View {
    @State var showTransactionsLayout = false
    
    var difference: String
    var personWithDebtDetails: User
    var personWithoutDebtDetails: User
    
    
    init(pairsSummary: [String : Double], pairId: String, usersDetails: [String : User]) {
        let UserIds = decodePairIdToUserIds(pairId: pairId)
        let moneyPayedByFirstUser: Double = pairsSummary[UserIds[0]] ?? 0
        let moneyPayedBySecondUser: Double = pairsSummary[UserIds[1]] ?? 0
        
        let personWithDebt: String = moneyPayedByFirstUser < moneyPayedBySecondUser ? UserIds[0] : UserIds[1]
        let personWithoutDebt: String = moneyPayedByFirstUser > moneyPayedBySecondUser ? UserIds[0] : UserIds[1]
        
        personWithDebtDetails = PairsSummary.PairsSummaryMock.usersDetails[personWithDebt]!
        personWithoutDebtDetails = PairsSummary.PairsSummaryMock.usersDetails[personWithoutDebt]!
        
        difference = String(format: "%.2f", abs(moneyPayedBySecondUser - moneyPayedByFirstUser))
    }
    
    
    var body: some View {
            VStack {
                VStack {
                    HStack {
                        Image(personWithDebtDetails.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 64)
                        
                        Image(systemName: "yensign")
                            .foregroundColor(.black)
                            .font(.title2)
                        
                        Text("\(difference)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                        Image(personWithoutDebtDetails.avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 64)
                            
                    }
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.black)
                        .padding(.top, -24)
               
                }
                
                Text("\(personWithDebtDetails.name) should return \(difference) yen to \(personWithoutDebtDetails.name)")
            }
            .foregroundColor(.black)
    }
}

#Preview {
    Summary(
        pairsSummary: PairsSummary.PairsSummaryMock.pairsSummaries["userWithId1_userWithId2"]!,
        pairId: "userWithId1_userWithId2",
        usersDetails: PairsSummary.PairsSummaryMock.usersDetails
    )
}
