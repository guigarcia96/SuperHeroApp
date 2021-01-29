//
//  APIRequest.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 28/01/21.
//

import Foundation

enum ItemError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class APIRequest {
    
    
    class func loadItems(heroName:String, onComplete: @escaping (Welcome) -> Void, onError: @escaping  (ItemError) -> Void) {
        
        let basePath = "https://superheroapi.com/api/3570288816360340/search/\(heroName)"
        
        let session = URLSession.shared
        
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
            
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?)
            in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {return}
                    do {
                        let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                        onComplete(welcome)
                    } catch {
                        print(error.localizedDescription)
                    }
                }else {
                    print ("Erro ao carregar")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        
        dataTask.resume()
        
    }
    
}
