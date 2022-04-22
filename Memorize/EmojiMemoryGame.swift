//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Joonhwan Jeon on 2022/04/12.
//

//ViewModel
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["💡", "📋", "🖥", "😺", "🗺", "😱", "🙈", "🤔", "📪", "👨‍🏫", "📱", "🎉", "📄", "💁", "📞", "👨‍💻", "⚒", "🙋", "🤵‍♂️", "😀", "😃", "😄", "😁"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
