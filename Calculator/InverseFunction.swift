//
//  InverseFunction.swift
//  Calculator
//
//  Created by ARCK on 2020/3/29.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import SwiftUI

struct InverseFunction: View {
    let wayOptions: Array<String> = ["年","月","日"]   //由于selection为int类型，故再设Array作为映射
    let rateOptions: Array<String> = ["年","月","日"]
    @State var InitialMoney : String = ""
    @State var FinalMoney :String = ""  //It looks that Text can only be String.
    @State var Rate : String = ""
    @State var Time : String = ""
    @State var WayNum : Int = 0
    @State var RateNum : Int = 0
   
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                        HStack() {
                                    Text("目标存款:")             //目标存款
                                        .font(.title)
                            TextField("Please input...",text:$FinalMoney)
                                         .padding(.trailing)
                                .frame(width: 160.0, height: 30.0)
                                        .keyboardType(.decimalPad)            //九宫格数字小键盘
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                    
                        }
                        .padding(.trailing, -13.0)
                                    
                        Spacer()
                            .frame(height: 10.0)
                                
                        
                            HStack {
                                Text("复利方式:")         //复利方式
                                    .font(.title)
                                    .padding(.trailing)
                                Picker(selection: $WayNum, label: Text("WayPicker")) {   //Selection represents the tag of choice.
                                    Text("年").tag(0)
                                    Text("月").tag(1)
                                    Text("日").tag(2)  //Tag represents the index of choice.
                                }
                                .frame(width: 200.0)
                                .pickerStyle(SegmentedPickerStyle())
                            }
                            .padding(.trailing, -2.0)
                            
                        
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
                                    Text("最低所需本金:")
                                        .font(.title)
                                             //最低本金
                                    Text(self.InitialMoney)
                                        .padding(.trailing)
                                        .frame(width: 140.0, height: 30.0)
                                    
                                    
                                }
                                .padding(.trailing, -1.0)
                        Spacer()
                            .frame(height: 50.0)
                   
                       
                    }
                    .padding()
            .frame(height: nil)
            Button(action: {
                               if self.FinalMoney == "" || self.Rate == "" || self.Time == ""
                               {
                                   self.InitialMoney = "N/A"
                               }
                               else{
                               D_FinalMoney = D_trans(t:self.FinalMoney)
                               D_Rate = D_trans(t:self.Rate)
                               I_Time = I_trans(t:self.Time)
                                   D_InitialMoney = Inverse_cal(FinalMoney: D_FinalMoney,WayNum:self.WayNum,Rate:D_Rate,RateNum:self.RateNum,Time:I_Time)
                               self.InitialMoney = String(D_InitialMoney)
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
        }
    }
}

struct InverseFunction_Previews: PreviewProvider {
    static var previews: some View {
        InverseFunction()
    }
}
