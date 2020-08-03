//
//  ContentView.swift
//  slots
//
//  Created by Len Huang on 8/3/20.
//  Copyright © 2020 Len Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var credits = 1000
    @State private var numbers = [0, 1, 2]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var symbols = ["apple", "lemon", "donut"]
    private var betAmount = 5
    
    public var secondary = Color(red:0, green: 0, blue: 40/255)
    public var primary = Color(.black)
    public var width = CGFloat(75)
    
    var body: some View {
        ZStack {
            // Background
            Rectangle().foregroundColor(primary).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 45)).frame(width: width).edgesIgnoringSafeArea(.all)
           Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 90)).frame(width: width).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 135)).frame(width: width).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 180)).frame(width: width).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                // Title
                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Text("Tic Tac Slots").bold().foregroundColor(.white)
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    
                }.scaleEffect(2)
                Spacer()
                // Credits Counter
                Text("Credits: " +  String(self.credits)).foregroundColor(.black)
                    .padding(.all,10).background(Color.white.opacity(0.5)).cornerRadius(20)
                Spacer()
                // Cards
                HStack {
                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[0])
                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[1])
                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[2])
                }
                HStack {
                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[0])
                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[1])
                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[2])
                }
                HStack {
                    CardView(symbol: $symbols[numbers[0]],
                             background: $backgrounds[0])
                    CardView(symbol: $symbols[numbers[1]],
                             background: $backgrounds[1])
                    CardView(symbol: $symbols[numbers[2]],
                             background: $backgrounds[2])
                }
                Spacer()
                // Button
                Button(action: {
                    // Increment
                    self.credits += 1
                    // Set background to white
                    self.backgrounds = self.backgrounds.map { _ in
                        Color.white
                    }
                    // Change images
                    self.numbers = self.numbers.map { _ in
                        Int.random(in: 0...self.symbols.count - 1)
                    }
                    // Check Winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        // Won
                        self.credits += self.betAmount * 10
                        // Update backgrounds to green
                        self.backgrounds = self.backgrounds.map { _ in
                            Color.green
                        }
                    } else {
                        self.credits -= self.betAmount
                    }
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                .padding(.bottom, 20.0)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
