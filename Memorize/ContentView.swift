//
//  ContentView.swift
//  Memorize
//
//  Created by Joonhwan Jeon on 2022/04/08.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["💡", "📋", "🖥", "😺", "🗺", "😱", "🙈", "🤔", "📪", "👨‍🏫", "📱", "🎉", "📄", "💁", "📞", "👨‍💻", "⚒", "🙋", "🤵‍♂️", "😀", "😃", "😄", "😁"]
    @State private var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var content: String
    @State private var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
