//
//  ReviewResponse.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

struct ReviewResponse: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    //    let author: Author
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    let rating: Label
    
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Label: Decodable {
    let label: String
}

struct Author: Decodable {
    let name: Label
}




