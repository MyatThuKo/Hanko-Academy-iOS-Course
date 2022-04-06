//
//  WordDetailTableViewCell.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 4/4/22.
//

import UIKit

class WordDetailTableViewCell: UITableViewCell {
    
    // MARK: - UIProperties
    let wordView: WordView = {
        let wordView = WordView()
        wordView.translatesAutoresizingMaskIntoConstraints = false
        wordView.backgroundColor = UIColor(named: "VerySoftOrange")
        wordView.layer.cornerRadius = 25
        return wordView
    }()
    
    let background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "VerySoftOrange")
        view.layer.cornerRadius = 25
        return view
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        contentView.addSubview(background)
        background.addSubview(wordView)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            wordView.topAnchor.constraint(equalTo: background.topAnchor),
            wordView.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            wordView.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            wordView.bottomAnchor.constraint(equalTo: background.bottomAnchor)
        ])
    }
    
    func load(word: String, partOfSpeech: String, definition: String) {
        wordView.inputText(word: word, partOfSpeech: partOfSpeech, definition: definition)
    }
}
