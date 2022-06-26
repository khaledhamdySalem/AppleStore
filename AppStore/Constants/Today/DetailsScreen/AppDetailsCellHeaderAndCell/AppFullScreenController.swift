////
////  AppFullScreenController.swift
////  AppStore
////
////  Created by KH on 21/06/2022.
////
//
//import UIKit
//
//class AppFullScreenController: UITableViewController {
//    
//    var dismissHandler: (() -> ())?
//    var todayItem: TodayItem?
//    
//    // MARK: -- DidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureTableView()
//       
//    }
//    
//    @objc func handleClose() {
//        print("👀")
//    }
//    
//    // MARK: -- Configure Tableview
//    fileprivate func configureTableView() {
//        tableView.contentInset = .init(top: 0, left: 0, bottom: 16, right: 0)
//        tableView.contentInsetAdjustmentBehavior = .never
//        tableView.register(AppFullCell.self, forCellReuseIdentifier: Idetidiers.appFullScreen)
//        tableView.tableFooterView = UIView()
//        tableView.separatorStyle = .none
//    }
//}
//
//extension AppFullScreenController {
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.item == 0 {
//            let headerCell = AppHeaderFullDetailsCell()
//            headerCell.closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
//            headerCell.todayCell.todayItem = todayItem
//            return headerCell
//        }
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: Idetidiers.appFullScreen, for: indexPath) as! AppFullCell
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.row {
//        case 0:
//            return Idetidiers.sizeOfCell
//        case 1:
//            return super.tableView(tableView, heightForRowAt: indexPath)
//        default:
//            return 0
//        }
//    }
//    
//    @objc fileprivate func handleCloseButton(button: UIButton) {
//        button.isHidden = true
//        dismissHandler?()
//    }
//}
