//
//  WordView.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 4/4/22.
//

import UIKit

class WordView: UIView {
    
    // MARK: - UI Properties
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
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .lastBaseline
        stackView.spacing = 10
        return stackView
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
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        horizontalStackView.addArrangedSubview(randomWordLabel)
        horizontalStackView.addArrangedSubview(partsOfSpeechLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(definitionLabel)
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func inputText(word: String, partOfSpeech: String, definition: String) {
        randomWordLabel.text = word
        partsOfSpeechLabel.text = partOfSpeech
        definitionLabel.text = definition
    }
}
