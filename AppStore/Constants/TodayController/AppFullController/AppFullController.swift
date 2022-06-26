////
////  AppFullController.swift
////  AppStore
////
////  Created by KH on 24/06/2022.
////
//
//import UIKit
//class AppFullController: UITableViewController {
//    
//    var dismissHandler: (() -> Void)?
//    let floatingContainerView = UIView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureTableView()
//    }
//    
//    @objc func handleDismiss(button : UIButton){
//        print("👀👀👀👀")
////        button.isHidden = true
////        dismissHandler?()
//    }
//    
//    fileprivate func configureTableView() {
//        tableView.tableFooterView = UIView()
////        tableView.allowsSelection = false
//        tableView.separatorStyle = .none
//        tableView.register(AppFullScreeDescriptionCell.self, forCellReuseIdentifier: Idetidiers.appFullScreen)
//        tableView.register(HeaderCell.self, forCellReuseIdentifier: "cell")
//    }
//}
//
//extension AppFullController {
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeaderCell
//            cell.button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
//            return cell
//        } else if indexPath.row == 1 {
//            let header = AppFullHeaderCell()
//            return header
//        }
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: Idetidiers.appFullScreen, for: indexPath) as! AppFullScreeDescriptionCell
//        return cell
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 32
//        }
//        else if indexPath.row == 1 {
//            return Idetidiers.sizeOfCell
//        }
//        return super.tableView(tableView, heightForRowAt: indexPath)
//    }
//}
