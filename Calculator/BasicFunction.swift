//
//  BasicFunction.swift
//  Calculator
//
//  Created by ARCK on 2020/3/28.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI
import UIKit


struct BasicFunction: View {
    
   
    
    let wayOptions: Array<String> = ["年","月","日"]   //由于selection为int类型，故再设Array作为映射
    let rateOptions: Array<String> = ["年","月","日"]
    let additionOptions: Array<String> = ["年","月","日"]
    @State var InitialMoney : String = ""
    @State var FinalMoney :String = ""  //It looks that Text can only be String.
    @State var Rate : String = ""
    @State var Time : String = ""
    @State var WayNum : Int = 0
    @State var RateNum : Int = 0
    @State var AdditonNum : Int = 0
    @State var AdditionMoney : String = ""
    
 /*   func test_Empty()
    {
        if self.InitialMoney == "" || self.Rate == "" || self.Time == ""
        {
            self.FinalMoney = "N/A"
        }
    }    */
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                
                HStack() {
                    
                    
                        Text("本金:")
                            .font(.title)
                    
                                //本金
                                
                    
                        TextField("Please input...",text:$InitialMoney)
                                     .padding()
                                    .frame(width: 140.0, height: 30.0)
                                    .keyboardType(.decimalPad)            //九宫格数字小键盘
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                            
                }
                .padding(.trailing)
                .frame(width: nil)
                            
                Spacer()
                    .frame(height: 10.0)
                        
                
                    HStack {
                        
                            Text("复利方式:")         //复利方式
                                .font(.title)
                                
                        
                        
                            Picker(selection: $WayNum, label: Text("WayPicker")) {   //Selection represents the tag of choice.
                                Text("年").tag(0)
                                Text("月").tag(1)
                                Text("日").tag(2)  //Tag represents the index of choice.
                            }
                            .frame(width: 200.0)
                            .pickerStyle(SegmentedPickerStyle())
                            
                        
                    }
                    .padding(.trailing, 0.0)
                    
                
                        Spacer()
                                       .frame(height: 10.0)
                                           
                           
                HStack {
                    
                Text("利率:")
                        .font(.title)
                    TextField("Please input...",text:$Rate)
                        .padding()
                         .keyboardType(.decimalPad)
                        .frame(width: 87.0, height: 30.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("%")
                    Picker(selection: $RateNum, label: Text("RatePicker")) {
                        Text("年").tag(0)
                        Text("月").tag(1)
                        Text("日").tag(2)           //选择利率时长
                        
                    }
                    .frame(width: 150.0)
                    .pickerStyle(SegmentedPickerStyle())     //Change the style of Picker.
                        
                    
                }
                .padding(.trailing, -10.0)
                HStack {
                  
                            Text("追加投资:")    //Additional Money
                                .font(.title)
                            
                    TextField("Please input...", text: $AdditionMoney)
                        .frame(width: 100.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                      .keyboardType(.decimalPad)
                    Text("/ \(translating(source:self.wayOptions[WayNum]))")
                    
             /*       Picker(selection: $AdditonNum, label: Text("AdditionalPicker")) {
                        Text("年").tag(0)
                        Text("月").tag(1)
                        Text("日").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())  */
                }
                .padding(.trailing)
         
                
                HStack {
                   
                            
                            Text("投资期限:")       //存入时长
                                .font(.title)
                    
                    TextField("Please input...",text:$Time)
                    .padding(.trailing)
                        .keyboardType(.numberPad)
                        .frame(width: 100.0, height: 30.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text(translating(source:self.wayOptions[WayNum]))
                }
                .padding(.trailing)
            
                                          
                        HStack {
                            Text("本利和:")
                                .font(.title)     //本息和
                            Text(self.FinalMoney)
                                .padding(.trailing)
                                .frame(width: 160.0, height: 30.0)
                            
                            
                        }
                        .padding(.trailing)
                Spacer()
                    .frame(height: 50.0)
                
               
            }
            .padding()
            .frame(height: nil)
            Button(action: {
                            if self.InitialMoney == "" || self.Rate == "" || self.Time == ""
                            {
                                self.FinalMoney = "N/A"
                            }
                            else{
                                D_InitialMoney = D_trans(t:self.InitialMoney)
                                D_Rate = D_trans(t:self.Rate)
                                if self.AdditionMoney == ""
                                {
                                    D_AdditionMoney = 0
                                }
                                else   {D_AdditionMoney = D_trans(t:self.AdditionMoney)
                                }
                                I_Time = I_trans(t:self.Time)
                                D_FinalMoney = Final_cal(InitialMoney: D_InitialMoney, WayNum: self.WayNum, Rate: D_Rate, RateNum: self.RateNum,AdditionMoney:D_AdditionMoney,Time: I_Time)
                                self.FinalMoney = String(D_FinalMoney)
                            }
                            
                        }) {
                            Text(" 计算 ")
                                .font(.title)         //计算按钮
                            .fontWeight(.black)
                            .background(Color.black)      //按钮背景色
                            .foregroundColor(.white)     //字体颜色
            //                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)    //边框
                            .frame(height: nil)
                            .cornerRadius(10)    //圆角
                            .shadow(radius: 4)
                        }
                        .padding()
        }

    }
}

struct function_Previews: PreviewProvider {
    static var previews: some View {
        BasicFunction()
    }
}
