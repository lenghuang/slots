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
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
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
                VStack {
                    HStack {
                        CardView(symbol: $symbols[numbers[0]],
                                 background: $backgrounds[0])
                        CardView(symbol: $symbols[numbers[1]],
                                 background: $backgrounds[1])
                        CardView(symbol: $symbols[numbers[2]],
                                 background: $backgrounds[2])
                    }
                    HStack {
                        CardView(symbol: $symbols[numbers[3]],
                                 background: $backgrounds[3])
                        CardView(symbol: $symbols[numbers[4]],
                                 background: $backgrounds[4])
                        CardView(symbol: $symbols[numbers[5]],
                                 background: $backgrounds[5])
                    }
                    HStack {
                        CardView(symbol: $symbols[numbers[6]],
                                 background: $backgrounds[6])
                        CardView(symbol: $symbols[numbers[7]],
                                 background: $backgrounds[7])
                        CardView(symbol: $symbols[numbers[8]],
                                 background: $backgrounds[8])
                    }
                }
                Spacer()
                // Button
                Button(action: {
                    
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
    
    func processResults(_ isMax:Bool = false) {
        // Set background to white
        self.backgrounds = self.backgrounds.map { _ in
            Color.white
        }
        // change images
        if isMax {
            // spin all cards
            self.numbers = self.numbers.map({ _ in Int.random(in: 0...self.symbols.count - 1)})
        } else {
            // spin middle row
            self.numbers[3] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count - 1)
        }
        // Check winnings
        processWin(isMax)
    }
    func processWin(_ isMax:Bool=false) {
        
        var matches = 0
        
        if !isMax {
            // processing for single spin
            if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5] {
                // Won
                matches += 1
                // Update backgrounds to green
                self.backgrounds[3] = Color.green
                self.backgrounds[4] = Color.green
                self.backgrounds[5] = Color.green
            } else {
                self.credits -= self.betAmount
            }
        } else {
            // processing for max spin
            // top row
            
        }
    }
    func checkMatch(_(x,y,z):Tuple){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
