//
//  MemoryGame.swift
//  Memorize
//
//  Created by Joonhwan Jeon on 2022/04/12.
//

//Model
import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndIOnlyFaceUpCatd: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
           if let potentialMatchIndex = indexOfTheOneAndIOnlyFaceUpCatd {
               if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
           indexOfTheOneAndIOnlyFaceUpCatd = nil
           } else {
               for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndIOnlyFaceUpCatd = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
