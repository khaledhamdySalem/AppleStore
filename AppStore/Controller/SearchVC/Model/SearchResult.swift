//
//  SearchResult.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let screenshotUrls: [String]?
    let trackName: String?
    let primaryGenreId: Int?
    let averageUserRating: Float?
    let primaryGenreName: String?
    let artworkUrl100: String?
    let formattedPrice: String?
    let description: String?
    let releaseNotes: String?
    
    var avgRating: String {
        return "Rating: \(Int(averageUserRating ?? 0))"
    }
    
    var imageUrl: URL {
        return URL(string: artworkUrl100 ?? "")!
    }
}


