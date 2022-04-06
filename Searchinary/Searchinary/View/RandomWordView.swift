//
//  RandomWordView.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/27/22.
//

import UIKit

class RandomWordView: UIView {
    
    var randomWordsList = WordList()
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Searchinary..."
        label.font = UIFont(name: "DancingScript-Bold", size: 56)
        return label
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "PastelGreen")
        view.layer.cornerRadius = 25
        return view
    }()
    
    let randomWordView: WordView = {
        let wordView = WordView()
        wordView.translatesAutoresizingMaskIntoConstraints = false
        return wordView
    }()
    
    let randomWordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.triangle.2.circlepath.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(getRandomWord), for: .touchUpInside)
        return button
    }()
    
    let tableView: UIView = {
        let uiView = FavoriteWordTableView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "SoftAmber")
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func getRandomWord() {
        var randomWord = randomWordsList.list.randomElement()
        let word = randomWord?.word ?? ""
        let definition = randomWord?.definition ?? ""
        let partOfSpeech = randomWord?.partOfSpeech ?? ""
        randomWordView.inputText(word: word, partOfSpeech: partOfSpeech, definition: definition)
    }
    
    private func setUpUI() {
        addAppTitleLabel()
        addRandomWordView()
        addTableView()
    }
    
    private func addAppTitleLabel() {
        addSubview(appTitleLabel)
        
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            appTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            appTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
        ])
    }
    
    private func addRandomWordView() {
        addSubview(backgroundView)
        backgroundView.addSubview(randomWordView)
        backgroundView.addSubview(randomWordButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 20),
            backgroundView.leadingAnchor.constraint(equalTo: appTitleLabel.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            randomWordView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            randomWordView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            randomWordView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            randomWordButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15),
            randomWordButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -15),
            randomWordButton.heightAnchor.constraint(equalToConstant: 50),
            randomWordButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
