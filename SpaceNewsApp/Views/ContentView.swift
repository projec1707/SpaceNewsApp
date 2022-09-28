//
//  ContentView.swift
//  SpaceNewsApp
//
//  Created by Roman Riepa on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                NewsView()
                    .opacity(opac)
            }
            .navigationTitle("Space News")
            .environmentObject(data)
            .onAppear {
                data.getData()
                
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
