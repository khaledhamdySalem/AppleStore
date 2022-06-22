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
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TodayCell()
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Idetidiers.sizeOfCell
    }
}

extension AppFullScreenController {

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Idetidiers.appFullScreen, for: indexPath) as! AppFullCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
