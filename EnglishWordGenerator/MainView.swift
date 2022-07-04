//
//  MainView.swift
//  EnglishWordGenerator
//
//  Created by 김민택 on 2022/05/30.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var numberOfWord: Int = 10
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose a number between 1 and 15.")
                Stepper(value: $numberOfWord, in: 1...15, step: 1, label: { Text("\(numberOfWord)개") })
                NavigationLink(destination: { SecondView(numberOfWord: $numberOfWord) }, label: {
                    Text("Generate")
                })
            }
        }
        .padding(.horizontal, 16)
    }
}
