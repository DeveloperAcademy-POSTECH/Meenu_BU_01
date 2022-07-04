//
//  SecondView.swift
//  EnglishWordGenerator
//
//  Created by 김민택 on 2022/05/30.
//

import SwiftUI

struct WordCard: View {
    var word: String
    
    var body: some View {
        Text(word)
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.15), radius: 30, x: 0, y: 0))
    }
}

struct SecondView: View {
    @ObservedObject var networkManager = NetworkManager()
    @Binding var numberOfWord: Int
    
    var body: some View {
        VStack {
            Stepper(value: $numberOfWord, in: 1...15, step: 1, label: { Text("\(numberOfWord)개") })
                .padding(.horizontal, 16)
            Button(action: {
                networkManager.getData(number: numberOfWord)
            }, label: {
                Text("Re-Generate")
            })
            List(networkManager.wordList, id: \.self) { word in
                Text(word)
            }
            .onAppear {
                networkManager.getData(number: numberOfWord)
            }
            
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(networkManager.wordList, id: \.self) { word in
//                        WordCard(word: word)
//                    }
//                }
//                .padding(16)
//            }
//            .onAppear {
//                networkManager.getData(number: numberOfWord)
//            }
        }
//        .padding(.horizontal, 16)
    }
}
