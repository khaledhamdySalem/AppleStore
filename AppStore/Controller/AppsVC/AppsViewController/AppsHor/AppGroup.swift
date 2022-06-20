//
//  AppGroup.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResults]
}

struct FeedResults: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
    let id: String
    //    let releaseDate: String
    //    let kind: String
    //    let url: String
}
