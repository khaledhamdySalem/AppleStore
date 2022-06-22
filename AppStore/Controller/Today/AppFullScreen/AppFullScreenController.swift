//
//  AppFullScreenController.swift
//  AppStore
//
//  Created by KH on 21/06/2022.
//

import UIKit

class AppFullScreenController: UITableViewController {
    
    // MARK: -- DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: -- Configure Tableview
    fileprivate func configureTableView() {
        tableView.register(AppFullCell.self, forCellReuseIdentifier: Idetidiers.appFullScreen)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    //MARK: -- Cell
    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let header = TodayCell()
    //        return header
    //    }
}

extension AppFullScreenController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            
        case 0:
            let cell = UITableViewCell()
            let todayCell = TodayCell()
            cell.addSubview(todayCell)
            todayCell.centerInSuperview(size: .init(width: 250, height: 250))
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Idetidiers.appFullScreen, for: indexPath) as! AppFullCell
            return cell
            
        default:
            print("An error Happen")
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return Idetidiers.sizeOfCell
        case 1:
            return super.tableView(tableView, heightForRowAt: indexPath)
        default:
            return 0
        }
    }
}
