//
//  headline.swift
//  Calculator
//
//  Created by ARCK on 2020/3/28.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI

struct headline: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"复利计算器"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .fontWeight(.heavy)
            .padding()
            .frame(width: 350.0, height: 39.0)
        
    }
}

struct headline_Previews: PreviewProvider {
    static var previews: some View {
        headline()
    }
}
