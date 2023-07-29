//
//  ContentView.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import SwiftUI

struct ContentView: View {

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
    ContentView()
}

