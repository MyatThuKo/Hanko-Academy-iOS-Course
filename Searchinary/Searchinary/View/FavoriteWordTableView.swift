//
//  FavoriteWordTableView.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 4/4/22.
//

import UIKit

//protocol FavoriteWordDelegate {
//    func handleDetailTap()
//}

class FavoriteWordTableView: UIView {
    
//    weak var favoriteWordDelegate: FavoriteWordDelegate?
    var randomWordsList = WordList()
    
    // MARK: - UI Properties
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 30
        tableView.register(WordDetailTableViewCell.self, forCellReuseIdentifier: "WordDetailTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    // MARK: - Initializers
    init(frame: CGRect, dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        super.init(frame: frame)
        
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        
        addFavoriteWordTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addFavoriteWordTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
