//
//  HistoryView.swift
//  EnglishWordGenerator
//
//  Created by 김민택 on 2022/07/10.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var networkManager: NetworkManager
    
    var body: some View {
        List(networkManager.wordHistory, id: \.self) { wordList in
            Section("\(networkManager.requestIndexOfWordList(wordList: wordList) + 1)'s Generation Result") {
                ForEach(wordList, id: \.self) { word in
                    Text(word)
                }
            }
        }
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
