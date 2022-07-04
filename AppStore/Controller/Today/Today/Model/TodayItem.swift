//
//  TodayItem.swift
//  AppStore
//
//  Created by KH on 22/06/2022.
//
//
import UIKit
//
struct TodayItem {
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    let cellType: CellType
    let apps: [FeedResults]
    
    
    enum CellType: String {
        case single
        case multiple
    }
}
