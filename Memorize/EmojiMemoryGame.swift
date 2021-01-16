//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chris Chau on 2021/1/9.
//  Copyright © 2021 Chris Chau. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(themeIndex: EmojiMemoryGame.selectedTheme)
    
    func startNewGame() {
        EmojiMemoryGame.selectedTheme = Int.random(in: 0..<EmojiMemoryGame.themes.count)
        self.model = EmojiMemoryGame.createMemoryGame(themeIndex: EmojiMemoryGame.selectedTheme)
    }
    
    static var themes = [
        Theme(name: "Meow", noOfPairsOfCards: Int.random(in: 6..<7), emojis: ["🐱","🐷","❤️","🥰","🤓","🐽","💖","💝","😊"], color: Color.blue),
        Theme(name: "Food", noOfPairsOfCards: Int.random(in: 6..<8), emojis: ["🍌","🍓","🥑","🍎","🍔","🥐","🥕","🍰","🍩"], color: Color.red),
        Theme(name: "Sports", noOfPairsOfCards: 6, emojis: ["⚽️","🏀","🏈","🏸","🏓","🎾"], color: Color.yellow),
        Theme(name: "Transportation", noOfPairsOfCards: 6, emojis: ["🚀","✈️","🛳","🚘","🚚","🚎"], color: Color.pink)
    ]
    
    static var selectedTheme = Int.random(in: 0..<EmojiMemoryGame.themes.count)
    
    var theme: Theme {
        EmojiMemoryGame.themes[EmojiMemoryGame.selectedTheme]
    }
    
    static func createMemoryGame(themeIndex: Int) -> MemoryGame<String> {
        let theme = EmojiMemoryGame.themes[themeIndex]
        return MemoryGame<String>(noOfPairsOfCards: theme.noOfPairsOfCards) { pairIndex in theme.emojis[pairIndex] }
    }
    
    var score: Int { model.score }
    
    // Mark - access
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // Mark - Intents
    func choose(card: MemoryGame<String>.Card){
        objectWillChange.send()
        model.choose(card:card)
    }
    
    struct Theme {
        var name: String
        var noOfPairsOfCards: Int
        var emojis: Array<String>
        var color: Color
    }
}
