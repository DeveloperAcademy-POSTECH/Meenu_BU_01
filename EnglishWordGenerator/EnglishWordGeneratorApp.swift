//
//  EnglishWordGeneratorApp.swift
//  EnglishWordGenerator
//
//  Created by 김민택 on 2022/05/30.
//

import SwiftUI

@main
struct EnglishWordGeneratorApp: App {
    private var networkManger = NetworkManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkManger)
        }
    }
}
