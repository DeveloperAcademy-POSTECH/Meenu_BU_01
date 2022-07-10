//
//  ContentView.swift
//  EnglishWordGenerator
//
//  Created by 김민택 on 2022/07/10.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                MainView().tabItem { Text("Home") }.tag(1)
                HistoryView().tabItem { Text("History") }.tag(2)
            }
            .navigationTitle(provideTitle(selection: selection))
        }
    }
    
    func provideTitle(selection: Int) -> String {
        switch selection {
        case 1:
            return "Home"
        case 2:
            return "History"
        default:
            return "Error"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
