//
//  AppFullScreenViewController.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class AppFullScreenViewController: UITableViewController {
    
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}

extension AppFullScreenViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let header = TodayHeaderCell()
            header.todayCell.todayItem = todayItem
            return header
        }
        
        let cell = DescriptionCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return Idetidiers.sizeOfCell
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    
}
