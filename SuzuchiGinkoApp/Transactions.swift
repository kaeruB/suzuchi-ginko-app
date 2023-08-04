//
//  Transactions.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 30/07/2023.
//

import SwiftUI

struct Transactions: View {
    var body: some View {
        VStack {
            SummaryLayout()
                .padding(.bottom, 48)
                .padding(.top, 48)
            
            History()
            
        }
        .padding()
    }
}

#Preview {
    Transactions()
}
