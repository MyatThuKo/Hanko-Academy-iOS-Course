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
    private var randomWordView: RandomWordView!
    
    override func loadView() {
        randomWordView = RandomWordView(frame: .zero, dataSource: self, delegate: self)
        view = randomWordView
    }
}

extension ViewController: UITableViewDataSource {
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(FavoriteWordDetailViewController(), animated: true)
    }
}
