//
//  AppFullScreenController.swift
//  AppStore
//
//  Created by KH on 01/07/2022.
//

import UIKit

class AppFullScreenController: UITableViewController {
    
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    fileprivate func configureTableView() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(AppFullScreenDescriptionCell.self, forCellReuseIdentifier: Idetidiers.appFullScreen)
        tableView.contentInset = .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}

extension AppFullScreenController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let header = AppFullScreenHeaderCell()
            header.headerCell.todayItem = todayItem
            header.clipsToBounds = true
            return header
        }
        
        let appFullScreen = AppFullScreenDescriptionCell()
        return appFullScreen
    }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return Idetidiers.sizeOfCell
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
}
