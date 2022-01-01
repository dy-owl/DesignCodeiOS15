//
//  Styles.swift
//  DesignCodeiOS15
//
//  Created by Dmytro Yantsybaiev on 01.01.2022.
//

import SwiftUI

/**
 This is your User documentation.
 A very long one.
 
 #Text
 It's very easy to make some words **bold** and other words *italic* with Markdown. You can even [link to Google!](http://google.com)
 
 #Lists
 Sometimes you want numbered lists:

 1. One
 2. Two
 3. Three

 Sometimes you want bullet points:

 * Start a line with a star
 * Profit!

 Alternatively,

 - Dashes work just as well
 - And if you have sub points, put two spaces before the dash or star:
   - Like this
   - And this
 
 #Code
 ```
 if (isAwesome){
   return true
 }
 ```
*/
struct StrokeStyle: ViewModifier {
    
    @Environment(\.colorScheme) public var colorScheme
    
    private let cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(
                        colors: [
                            .white.opacity(colorScheme == .light ? 0.3 : 0.6),
                            .black.opacity(colorScheme == .light ? 0.1 : 0.3)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    
    func strokeStyle(cornerRadius: CGFloat = 5) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
