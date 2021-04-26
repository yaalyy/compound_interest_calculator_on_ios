//
//  Graph.swift
//  Calculator
//
//  Created by ARCK on 2020/4/29.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct Graph: View {
    
    var body: some View {
        VStack{
        Text("如果图像未显示，请先返回上一栏进行计算后再查看图像")
            LineView(data: moneyAmount, title: "Amount",valueSpecifier: "%.2f")
                .frame(height: 400.0)
    }
    }
}

struct Graph_Previews: PreviewProvider {
    static var previews: some View {
        Graph()
    }
}
