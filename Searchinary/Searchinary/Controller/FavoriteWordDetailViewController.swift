//
//  FavoriteWordDetailViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 4/26/22.
//

import UIKit

class FavoriteWordDetailViewController: UIViewController {
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is a word label"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "SoftAmber")
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(wordLabel)
        
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: view.topAnchor),
            wordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wordLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
