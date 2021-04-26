//
//  BasicMode.swift
//  Calculator
//
//  Created by ARCK on 2020/3/29.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI



struct BasicMode: View {
    
    private func endEditing() {
            UIApplication.shared.endEditing()
    } 
    var body: some View {
        Background{
            Text("该模式用于在已知本金,利率,时间的情况下，计算本利和")
                .font(.footnote)
                .foregroundColor(Color.gray)
               BasicFunction()
        }.gesture(DragGesture().onEnded { value in
            self.endEditing()     //A drag gesture to exit the keyboard
        })
    }
}

struct BasicMode_Previews: PreviewProvider {
    static var previews: some View {
        BasicMode()
    }
}
