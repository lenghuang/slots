//
//  Background View.swift
//  slots
//
//  Created by Len Huang on 8/3/20.
//  Copyright © 2020 Len Huang. All rights reserved.
//

/*
 Circle()
 .fill(Color.white)
 .frame(width: 100, height: 50)
 */

import SwiftUI

struct BackgroundView: View {
    
    @Binding var primary:Color
    @Binding var secondary:Color
    @Binding var width:CGFloat
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(primary).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 45)).frame(width: width).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 90)).frame(width: width).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 135)).frame(width: width).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(secondary).rotationEffect(Angle(degrees: 180)).frame(width: width).edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(primary: Binding.constant(Color.red), secondary: Binding.constant(Color.blue),
        width: Binding.constant(CGFloat(100)))
    }
}
