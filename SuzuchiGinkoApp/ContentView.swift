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
            
            Header()
                .padding(.bottom, 30)
            
            PairsLayout()
                .padding()
        }
        
    }

}

#Preview {
    ContentView()
}

