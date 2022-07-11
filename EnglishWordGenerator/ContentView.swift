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
                MainView().tabItem {
                    Image(systemName: "house")
                            .environment(\.symbolVariants, .none)
                    Text("Home")
                }.tag(1)

                HistoryView().tabItem {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("History")
                }.tag(2)
            }
            .navigationTitle(changeNavigationTitle())
        }
    }
    
    func changeNavigationTitle() -> String {
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
