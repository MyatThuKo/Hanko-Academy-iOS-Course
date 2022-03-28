//
//  ViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/17/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var randomWordsList = WordList()
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Searchinary..."
        label.font = UIFont(name: "DancingScript-Bold", size: 56)
        return label
    }()
    
    let randomWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Football"
        label.font = UIFont(name: "Bitter-Bold", size: 20)
        return label
    }()
    
    let partsOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont(name: "Bitter-Italic", size: 15)
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(British English) a game played by two teams of eleven players who try to kick a round ball into the other team’s goal \n(American English) soccer"
        label.font = UIFont(name: "Bitter-Regular", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let pastelGreenBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "PastelGreen")
        view.layer.cornerRadius = 25
        return view
    }()
    
    let randomWordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.triangle.2.circlepath.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(getRandomWord), for: .touchUpInside)
        return button
    }()
    
    let favoriteWordTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 30
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "SoftAmber")
        
        favoriteWordTableView.dataSource = self
        favoriteWordTableView.delegate = self
        
        appTitleView()
        randomWordView()
        addFavoriteWordTableView()
    }
    
    @objc func getRandomWord() {
        var randomWord = randomWordsList.list.randomElement()
        randomWordLabel.text = randomWord?.word ?? ""
        definitionLabel.text = randomWord?.definition ?? ""
        partsOfSpeechLabel.text = randomWord?.partOfSpeech ?? ""
    }
    
    func appTitleView() {
        view.addSubview(appTitleLabel)
        
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            appTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ])
    }
    
    func randomWordView() {
        view.addSubview(pastelGreenBackground)
        pastelGreenBackground.addSubview(randomWordLabel)
        pastelGreenBackground.addSubview(partsOfSpeechLabel)
        pastelGreenBackground.addSubview(definitionLabel)
        pastelGreenBackground.addSubview(randomWordButton)
        
        NSLayoutConstraint.activate([
            pastelGreenBackground.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 20),
            pastelGreenBackground.leadingAnchor.constraint(equalTo: appTitleLabel.leadingAnchor, constant: 0),
            pastelGreenBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pastelGreenBackground.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            randomWordLabel.topAnchor.constraint(equalTo: pastelGreenBackground.topAnchor, constant: 15),
            randomWordLabel.leadingAnchor.constraint(equalTo: pastelGreenBackground.leadingAnchor, constant: 15),
            
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: randomWordLabel.trailingAnchor, constant: 5),
            partsOfSpeechLabel.topAnchor.constraint(equalTo: pastelGreenBackground.topAnchor, constant: 20),
            
            definitionLabel.topAnchor.constraint(equalTo: randomWordLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: randomWordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: pastelGreenBackground.trailingAnchor, constant: -15),
            
            randomWordButton.trailingAnchor.constraint(equalTo: pastelGreenBackground.trailingAnchor, constant: -15),
            randomWordButton.bottomAnchor.constraint(equalTo: pastelGreenBackground.bottomAnchor, constant: -15),
            randomWordButton.heightAnchor.constraint(equalToConstant: 50),
            randomWordButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addFavoriteWordTableView() {
        view.addSubview(favoriteWordTableView)
        
        NSLayoutConstraint.activate([
            favoriteWordTableView.topAnchor.constraint(equalTo: pastelGreenBackground.bottomAnchor, constant: 10),
            favoriteWordTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteWordTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteWordTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomWordsList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = randomWordsList.list[indexPath.row].word
        contentConfig.secondaryText = randomWordsList.list[indexPath.row].definition
        cell.contentConfiguration = contentConfig
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(randomWordsList.list[indexPath.row].word)")
    }
}
