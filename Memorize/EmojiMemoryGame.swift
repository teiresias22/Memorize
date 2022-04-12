//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Joonhwan Jeon on 2022/04/12.
//

//ViewModel
import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["💡", "📋", "🖥", "😺", "🗺", "😱", "🙈", "🤔", "📪", "👨‍🏫", "📱", "🎉", "📄", "💁", "📞", "👨‍💻", "⚒", "🙋", "🤵‍♂️", "😀", "😃", "😄", "😁"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
