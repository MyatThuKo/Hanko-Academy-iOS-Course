//
//  FavoriteWordTableView.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 4/4/22.
//

import UIKit

class FavoriteWordTableView: UIView {
    
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.dataSource = self
        tableView.delegate = self
        
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

extension FavoriteWordTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomWordsList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WordDetailTableViewCell", for: indexPath) as? WordDetailTableViewCell else {
            return UITableViewCell()
        }
        
        let word = randomWordsList.list[indexPath.row].word
        let partOfSpeech = randomWordsList.list[indexPath.row].partOfSpeech
        let definition = randomWordsList.list[indexPath.row].definition
        
        cell.load(word: word, partOfSpeech: partOfSpeech, definition: definition)
        
        return cell
    }
    
}

extension FavoriteWordTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.item.description)")
    }
}
