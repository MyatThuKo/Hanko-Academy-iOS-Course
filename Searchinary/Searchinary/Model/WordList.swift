//
//  WordDefinition.swift
//  Searchinary
//
//  Created by Myat Thu Ko on 3/27/22.
//

import Foundation

class WordList {
    let list: [Word] = [
        Word(word: "Football", partOfSpeech: "noun", definition: "(British English) a game played by two teams of eleven players who try to kick a round ball into the other team’s goal \n(American English) soccer"),
        Word(word: "Search", partOfSpeech: "noun", definition: "to try to find someone or something by looking very carefully"),
        Word(word: "Food", partOfSpeech: "noun", definition: "things that people and animals eat, such as vegetables or meat"),
        Word(word: "Software", partOfSpeech: "noun", definition: "the sets of programs that tell a computer how to do a particular job"),
        Word(word: "Engineer", partOfSpeech: "noun", definition: "someone whose job is to design or build roads, bridges, machines etc"),
        Word(word: "Program", partOfSpeech: "noun", definition: "a set of instructions given to a computer to make it perform an operation"),
        Word(word: "Beautiful", partOfSpeech: "adj", definition: "someone or something that is beautiful is extremely attractive to look at"),
        Word(word: "Basketball", partOfSpeech: "noun", definition: "a game played indoors between two teams of five players, in which each team tries to win points by throwing a ball through a net"),
        Word(word: "Vacation", partOfSpeech: "noun", definition: "(American English) time spent not working \n(British English) holiday")
    ]
}

protocol WordDetail {
    var word: String { get }
    var partOfSpeech: String { get }
    var definition: String { get }
}

class Word: WordDetail {
    let word: String
    let partOfSpeech: String
    let definition: String
    
    init(word: String, partOfSpeech: String, definition: String) {
        self.word = word
        self.partOfSpeech = partOfSpeech
        self.definition = definition
    }
}

struct Words: Codable {
    let word: String
    let definitions: [Definitions]
}

struct Definitions: Codable {
    let definition: String
    let partOfSpeech: String 
}
