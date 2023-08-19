//
//  HeaderView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Suzuchi Ginko")
                .font(.title2)
                .padding(.leading)
            
            Spacer()
            
            // todo user id
            Image(TransactionsSummary.TransactionsSummaryMock.usersDetails["userWithId1"]!.avatar)
                .resizable()
                .scaledToFit()
                .frame(height: 54)
            // todo remove this padding
                .padding()
            
            Button {
                //
            } label: {
                Image(systemName: "arrow.forward.square")
            }
            .font(.title3)
            .background(.clear)
            .foregroundColor(.black)
            .buttonStyle(.bordered)
            .cornerRadius(10)
            .padding(.trailing)
        }
        .background(.yellow)
    }
}

#Preview {
    HeaderView()
}
