//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Joonhwan Jeon on 2022/04/08.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
