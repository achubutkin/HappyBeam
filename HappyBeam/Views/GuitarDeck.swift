//
//  GuitarDeck.swift
//  HappyBeam
//
//  Created by Alexandr Chubutkin on 25/01/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct GuitarDeck: View {
    private var notes = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView (.vertical, showsIndicators: false) {
                ForEach (notes, id: \.hashValue) { id in
                    ZStack {
                        
                    }
                    .frame(width: 600, height: 100)
                    .background {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .opacity(0.4)
                    }
                    .id(id)
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    withAnimation (Animation.easeOut(duration: 1)) {
                        let item = notes.randomElement()
                        proxy.scrollTo(item)
                    }
                }
            }
            
            Button ("Scroll to random item") {
                withAnimation (Animation.easeOut(duration: 1)) {
                    let item = notes.randomElement()
                    proxy.scrollTo(item)
                }
            }
        }
        .frame(height: 300)
        .mask {
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black]), startPoint: .top, endPoint: .bottom)
        }
        
        /*
        ScrollView {
            ZStack {
                Text("Text over rectangle.")
                Rectangle()
                    .clipShape(.rect(cornerRadius: 25))
            }
            .glassBackgroundEffect(displayMode: .never)
            .frame(height: 200)
            .padding()
            
            ZStack {
                Text("Text over rectangle.")
                Rectangle()
                    .clipShape(.rect(cornerRadius: 25))
            }
            .glassBackgroundEffect(displayMode: .never)
            .frame(height: 200)
            .padding()
        }
        .mask {
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
        }
        */
    }
}

#Preview {
    GuitarDeck()
}
