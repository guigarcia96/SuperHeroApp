//
//  APIRequest.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 28/01/21.
//

import Foundation

class APIRequest {
    
    
    func loadItems(heroName:String, onComplete: @escaping (Welcome) -> Void) {
        
        let url = URL(string: "https://superheroapi.com/api/3570288816360340/search/\(heroName)")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            guard let welcome = try? JSONDecoder().decode(Welcome.self, from: data) else {return}
            onComplete(welcome)
        }

        task.resume()
    }
}
