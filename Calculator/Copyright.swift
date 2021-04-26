//
//  Copyright.swift
//  Calculator
//
//  Created by ARCK on 2020/3/29.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI

struct Copyright: View {    //A view for declaring the copyright
    var body: some View {
        VStack {
            Image("Logo")
                .frame(width: 100.0, height: 100.0)
                .clipped()
               
            
            Text("Yali Calculator")
                .font(.title)
            Text("Version 1.2.1")
            Spacer()
                .frame(height: 80.0)
            Text("Copyright © 2020 Connor Zhan. All rights reserved.")
                .font(.footnote)
                .foregroundColor(Color.gray)
        }
        
    }
}

struct Copyright_Previews: PreviewProvider {
    static var previews: some View {
        Copyright()
    }
}
