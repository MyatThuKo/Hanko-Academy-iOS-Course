//
//  ViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/17/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    override func loadView() {
        view = RandomWordView(frame: .zero)
    }
}
