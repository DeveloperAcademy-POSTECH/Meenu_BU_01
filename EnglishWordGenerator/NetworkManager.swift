//
//  NetworkManager.swift
//  EnglishWordGenerator
//
//  Created by 김민택 on 2022/06/02.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var wordList: [String] = []
    
    let urlString = "https://random-word-api.herokuapp.com/word"
    
    func getData(number: Int) {
        var urlComponents = URLComponents(string: urlString)
        let numberQuery = URLQueryItem(name: "number", value: "\(number)")
        urlComponents?.queryItems = [numberQuery]
        
        guard let url = URL(string: (urlComponents?.string)!) else {
            return
        }
        
        let requestURL = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: requestURL) { data, _, _ in
            guard let data = data else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode([String].self, from: data)
                DispatchQueue.main.async {
                    self.wordList = result
                }
            } catch {
                print("\(error.localizedDescription)\n\(error)")
            }
        }.resume()
    }
}
