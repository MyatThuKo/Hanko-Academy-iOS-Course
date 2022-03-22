//
//  ViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/17/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
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
    
    let definationLabel: UILabel = {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "SoftAmber")
        
        appTitleView()
        randomWordView()
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
        pastelGreenBackground.addSubview(definationLabel)
        
        NSLayoutConstraint.activate([
            pastelGreenBackground.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 20),
            pastelGreenBackground.leadingAnchor.constraint(equalTo: appTitleLabel.leadingAnchor, constant: 0),
            pastelGreenBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pastelGreenBackground.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            randomWordLabel.topAnchor.constraint(equalTo: pastelGreenBackground.topAnchor, constant: 15),
            randomWordLabel.leadingAnchor.constraint(equalTo: pastelGreenBackground.leadingAnchor, constant: 15),
            
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: randomWordLabel.trailingAnchor, constant: 5),
            partsOfSpeechLabel.topAnchor.constraint(equalTo: pastelGreenBackground.topAnchor, constant: 20),
            
            definationLabel.topAnchor.constraint(equalTo: randomWordLabel.bottomAnchor, constant: 10),
            definationLabel.leadingAnchor.constraint(equalTo: randomWordLabel.leadingAnchor, constant: 0),
            definationLabel.trailingAnchor.constraint(equalTo: pastelGreenBackground.trailingAnchor, constant: -15)
        ])
    }
}

