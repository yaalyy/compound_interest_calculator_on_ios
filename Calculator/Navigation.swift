//
//  Navigation.swift
//  Calculator
//
//  Created by ARCK on 2020/3/29.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI
import UIKit

struct Navigation: View {    //A view of navigation

    @State var selection: Int? = nil
    var body: some View {
        NavigationView{
            ZStack {
               
                VStack {
                        NavigationLink(destination: Copyright(),tag:0,selection:$selection) {    //Navagate to copyright view
                                                                       VStack {
                                                                           Button(action:{
                                                                            self.selection = 0
                                                                
                                                                               
                                                                           }){
                                                                            Text("About")
                                                                              .font(.callout)
                                                                              .fontWeight(.light)
                                                                              .foregroundColor(.gray)
                                                                                .padding()
                                                                                
                                                                           }
                                                                           
                                                                     
                                                                       }
                                                                    
                        }
                        .padding(.trailing, 300.0)
                        headline()
                            .padding(.bottom,10.0)
                            
                        Text("本利和=本金*(1+利率)^投资期限")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                            
                       Text("请根据需要选择您要计算的元素")
                       .font(.footnote)
                       .foregroundColor(Color.gray)
                       .padding(.bottom,80.0)
                        NavigationLink(destination: BasicMode(),tag:1,selection:$selection) {  // Navigate to BasicMode
                                           VStack {
                                               Button(action:{
                                                self.selection = 1
                                    
                                                   
                                               }){
                                                Text("  本利和计算  ")
                                                    .font(.largeTitle)
                                                    .fontWeight(.black)
                                                    .foregroundColor(.white)
                                                    .background(Color.orange)
                                                       .cornerRadius(10)
                                                       .shadow(radius: 4)
                                               }
                                               
                                         
                                           }
                                        
                        }
                        .padding(.bottom, 80.0)
                                   
                        
                        NavigationLink(destination: InverseMode(),tag:2,selection:$selection) {  //Navigate to InverseMode
                                           VStack {
                                               Button(action:{
                                                self.selection = 2
                                                   
                                               }){
                                                Text("  本金计算  ")
                                                    .font(.largeTitle)
                                                    .fontWeight(.black)
                                                    .foregroundColor(Color.white)
                                                    .background(Color.orange)
                                                       .cornerRadius(10)
                                                    .shadow(radius: 4)
                
                                               }
                                               
                                               
                                           }
                                        
                        }
                        .padding(.bottom, 80.0)
                       
                                       NavigationLink(destination: TimeMode(),tag:3,selection:$selection) {//Navigate to TimeMode
                                                          VStack {
                                                              Button(action:{
                                                               self.selection = 3
                                                                  
                                                              }){
                                                               Text("  投资期限计算  ")
                                                                .font(.largeTitle)
                                                                .fontWeight(.black)
                                                                .foregroundColor(.white)
                                                                      .background(Color.orange)
                                                                      .cornerRadius(10)
                                                                      .shadow(radius: 4)
                                                              }
                                                              
                                                          }
                                                       
                                       }
                                       .padding(.bottom, 180.0)
                        
                        
                        
                                   
                    
                }
            }
                
            
            
        }
        
        
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
