//
//  InverseMode.swift
//  Calculator
//
//  Created by ARCK on 2020/3/29.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI

struct InverseMode: View {
    private func endEditing() {
            UIApplication.shared.endEditing()
    }
    var body: some View {
        Background{
         Text("该模式用于在已知本利和,利率,投资时长的情况下，")
            .font(.footnote)
            .foregroundColor(Color.gray)
        Text("计算达到目标本利和的预计最少本金")
        .font(.footnote)
        .foregroundColor(Color.gray)
        InverseFunction()
        }.gesture(DragGesture().onEnded { value in
            self.endEditing()
        })
    }
}

struct InverseMode_Previews: PreviewProvider {
    static var previews: some View {
        InverseMode()
    }
}
