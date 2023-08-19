//
//  ContentView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import SwiftUI

struct TopView: View {

    var body: some View {
        VStack {
            HeaderView()

            PairsView(
                pairsSummaries: PairsSummary.PairsSummaryMock.pairsSummaries,
                pairsKeys: [String](PairsSummary.PairsSummaryMock.pairsSummaries.keys)
            )
            .padding()
        }
    }
}

#Preview {
    TopView()
}

