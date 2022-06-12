//
//  FavoriteWordDetailViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 4/26/22.
//

import UIKit

class FavoriteWordDetailViewController: UIViewController {
    
    // MARK:  Properties
    private var word: String
    private var partOfSpeech: String
    private var definition: String
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let wordView: WordView = {
        let wordView = WordView()
        wordView.translatesAutoresizingMaskIntoConstraints = false
        return wordView
    }()
    
    // MARK:  Initializers
    
    init(word: String, partOfSpeech: String, definition: String) {
        self.word = word
        self.partOfSpeech = partOfSpeech
        self.definition = definition
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "SoftAmber")
        setupUI()
    }
    
    func setupUI() {
        wordView.inputText(word: word, partOfSpeech: partOfSpeech, definition: definition)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(wordView)
        stackView.backgroundColor = UIColor(named: "LightGreen")
        stackView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
        ])
    }
}
