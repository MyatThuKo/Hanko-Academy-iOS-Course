//
//  ViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/17/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    private var randomWordView: RandomWordView!
    
    override func loadView() {
        randomWordView = RandomWordView(frame: .zero)
        view = randomWordView
    }
}
