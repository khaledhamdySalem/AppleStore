//
//  SearchVC.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    // MARK: -- Views
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        return collectionView
    }()
    let enterSearchTermLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please Enter Search Term Above..."
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // MARK: -- Properties
    var timer: Timer?
    fileprivate var results = [Result]()
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupSearchBar()
        configureSearchTermLabel()
    }
    
    // MARK: -- Configure CollectionView
    fileprivate func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        self.collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: Idetidiers.searchCell)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: -- Configure SearchTermLabel
    fileprivate func configureSearchTermLabel() {
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            
        }
    }
    
    // MARK: -- Handle Search
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

// MARK: -- Extension for DataSourse And Delegate
extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = results.count != 0
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.searchCell, for: indexPath) as! SearchCell
        cell.configureCell(items: results[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {_ in
            self.fetchSearchResults(searchText: searchText)
        })
    }
    
    // MARK: -- Fetch Data For Search
    fileprivate func fetchSearchResults(searchText: String) {
        Service.shared.fetchData(searchTerm: searchText) { searchResult, error in
            if let error = error { print(error) }
            self.results = searchResult ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
