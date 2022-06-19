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
                complition(nil, error)
            }
            do {
                guard let data = data else { return }
                let result = try JSONDecoder().decode(SearchResult.self, from: data)
                complition(result.results, error)
            } catch {
                complition(nil, error)
            }
            
        }.resume()
    }
    
    // For AppsVC Screen
    func fetchFreeGames(complition: @escaping (AppGroup?, Error?) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        fetchAppGroup(urlString: urlString, complition: complition)
    }
    
    func fetchPaidGames(complition: @escaping (AppGroup?, Error?) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        fetchAppGroup(urlString: urlString, complition: complition)
    }
    
    func fetchAppGroup(urlString:String, complition: @escaping (AppGroup?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                complition(nil, error)
            }
            
            do {
                guard let data = data else { return }
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                complition(appGroup, nil)
            } catch {
                complition(nil, error)
            }
        }.resume()
    }
}
