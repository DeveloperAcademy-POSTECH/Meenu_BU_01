//
//  WordGeneratingViewView.swift
//  EnglishWordGenerator
//
//  Created by 김민택 on 2022/05/30.
//

import SwiftUI

struct WordGeneratingView: View {
    @StateObject var networkManager = NetworkManager()
    @Binding var numberOfWord: Int
    
    var body: some View {
        VStack {
            Stepper(value: $numberOfWord, in: 1...15, step: 1, label: { Text("\(numberOfWord)개") })
                .padding(.horizontal, 16)
            
            Button(action: {
                networkManager.requestWordList(number: numberOfWord)
            }, label: {
                Text("Re-Generate")
            })
            
            List(networkManager.wordList, id: \.self) { word in
                Text(word)
            }
            .onAppear {
                networkManager.requestWordList(number: numberOfWord)
            }
        }
        .navigationTitle("Word Generator")
    }
}
