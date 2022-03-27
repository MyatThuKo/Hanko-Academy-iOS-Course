//
//  ViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/17/22.
//

import UIKit

struct wordDefinition {
    let word: String
    let partOfSpeech: String
    let definition: String
}

class ViewController: UIViewController {
    // MARK: - Properties
    let randomWordsList: [wordDefinition] = [
        wordDefinition(word: "Football", partOfSpeech: "noun", definition: "(British English) a game played by two teams of eleven players who try to kick a round ball into the other team’s goal \n(American English) soccer"),
        wordDefinition(word: "Search", partOfSpeech: "noun", definition: "to try to find someone or something by looking very carefully"),
        wordDefinition(word: "Food", partOfSpeech: "noun", definition: "things that people and animals eat, such as vegetables or meat"),
        wordDefinition(word: "Software", partOfSpeech: "noun", definition: "the sets of programs that tell a computer how to do a particular job"),
        wordDefinition(word: "Engineer", partOfSpeech: "noun", definition: "someone whose job is to design or build roads, bridges, machines etc"),
        wordDefinition(word: "Program", partOfSpeech: "noun", definition: "a set of instructions given to a computer to make it perform an operation"),
        wordDefinition(word: "Beautiful", partOfSpeech: "adj", definition: "someone or something that is beautiful is extremely attractive to look at"),
        wordDefinition(word: "Basketball", partOfSpeech: "noun", definition: "a game played indoors between two teams of five players, in which each team tries to win points by throwing a ball through a net"),
        wordDefinition(word: "Vacation", partOfSpeech: "noun", definition: "(American English) time spent not working \n(British English) holiday")
    ]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "SoftAmber")
        
        appTitleView()
        randomWordView()
    }
    
    @objc func getRandomWord() {
        var randomWord = randomWordsList.randomElement()
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
            pastelGreenBackground.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            randomWordLabel.topAnchor.constraint(equalTo: pastelGreenBackground.topAnchor, constant: 15),
            randomWordLabel.leadingAnchor.constraint(equalTo: pastelGreenBackground.leadingAnchor, constant: 15),
            
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: randomWordLabel.trailingAnchor, constant: 5),
            partsOfSpeechLabel.topAnchor.constraint(equalTo: pastelGreenBackground.topAnchor, constant: 20),
            
            definitionLabel.topAnchor.constraint(equalTo: randomWordLabel.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: randomWordLabel.leadingAnchor, constant: 0),
            definitionLabel.trailingAnchor.constraint(equalTo: pastelGreenBackground.trailingAnchor, constant: -15),
            
            randomWordButton.trailingAnchor.constraint(equalTo: pastelGreenBackground.trailingAnchor, constant: -15),
            randomWordButton.bottomAnchor.constraint(equalTo: pastelGreenBackground.bottomAnchor, constant: -15),
            randomWordButton.heightAnchor.constraint(equalToConstant: 50),
            randomWordButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

