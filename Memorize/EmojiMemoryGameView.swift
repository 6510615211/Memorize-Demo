//
//  ContentView.swift
//  Memorize
//
//  Created by นางสาวพรนัชชา ประทีปสังคม 
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    
    var emojis = ["🎃", "💀", "🕸️", "😈", "🎃", "💀", "🕸️", "😈"]
    @State var cardCount = 4
   
    
    var body: some View {
        VStack {
            ScrollView{
               cards
            }
            cardCountAdjusters
        }
        .padding()
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    var cardCountAdjusters: some View{
        HStack {
            cardCountAdjuster(offset: -1, symbol: "rectangle.stack.fill.badge.minus")
            Spacer()
            cardCountAdjuster(offset: 1, symbol: "rectangle.stack.fill.badge.plus")
        }
    }
    
    func cardCountAdjuster(offset: Int,symbol: String) -> some View {
        Button(action:{
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
                .imageScale(.large)
                .font(.largeTitle)
        })
        .disabled(cardCount + offset < 1||cardCount + offset > emojis.count)
    }
}

#Preview {
    EmojiMemoryGameView()
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            var base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            }
        
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
