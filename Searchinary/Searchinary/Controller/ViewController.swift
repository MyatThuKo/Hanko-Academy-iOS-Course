//
//  ViewController.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/17/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    // MARK: - Properties
    var randomWordsList = WordList()
    private var randomWordView: RandomWordView!
    
    var word = ""
    var partOfSpeech = ""
    var definition = ""
    
    override func loadView() {
        randomWordView = RandomWordView(frame: .zero, dataSource: self, delegate: self)
        searchWords()
        view = randomWordView
    }
    
    func searchWords() {
        let headers = [
            "X-RapidAPI-Key": "duh",
            "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
        ]

        let urlRequest = NSMutableURLRequest(url: NSURL(string: "https://wordsapiv1.p.rapidapi.com/words/incredible/definitions")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let words = try JSONDecoder().decode(Words.self, from: data)
                self.word = words.word
                self.definition = words.definitions[0].definition
                self.partOfSpeech = words.definitions[0].partOfSpeech
            } catch {    
                print("Failed to decode. \(error.localizedDescription)")
            }
        }).resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WordDetailTableViewCell", for: indexPath) as? WordDetailTableViewCell else {
            return UITableViewCell()
        }
        
//        let word = randomWordsList.list[indexPath.row].word
//        let partOfSpeech = randomWordsList.list[indexPath.row].partOfSpeech
//        let definition = randomWordsList.list[indexPath.row].definition
        let word = self.word
        let partOfSpeech = self.partOfSpeech
        let definition = self.definition
        print("Word - \(word)")
        print("definition - \(definition)")
        print("partOfSpeech - \(partOfSpeech)")
        
        cell.load(word: word, partOfSpeech: partOfSpeech, definition: definition)
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let word = randomWordsList.list[indexPath.row].word
        let partOfSpeech = randomWordsList.list[indexPath.row].partOfSpeech
        let definition = randomWordsList.list[indexPath.row].definition
        
        navigationController?.pushViewController(FavoriteWordDetailViewController(word: word, partOfSpeech: partOfSpeech, definition: definition), animated: true)
    }
}
