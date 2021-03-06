//
//  Service.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import Foundation

class Service {
    static var shared =  Service()
    init() {}
    
    // For SearchVC Screen
    func fetchData(searchTerm: String, complition: @escaping ([Result]?, Error?) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                complition(nil, error)
            }
            do {
                guard let data = data else { return }
                let result = try JSONDecoder().decode(SearchResult.self, from: data)
                complition(result.results, error)
            } catch {
                print(error)
                complition(nil, error)
            }
            
        }.resume()
    }
    
    // For AppsVC Screen
    func fetchGames(complition: @escaping (AppGroup?, Error?) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                complition(nil, error)
            }
            
            do {
                guard let data = data else { return }
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                complition(appGroup, nil)
            } catch {
                print(error)
                complition(nil, error)
            }
        }.resume()
    }
}
