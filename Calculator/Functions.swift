//
//  Functions.swift
//  Calculator
//
//  Created by ARCK on 2020/3/29.
//  Copyright © 2020 Connor Zhan. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


var D_InitialMoney : Double = 0
var D_FinalMoney :Double = 0
var D_AdditionMoney : Double = 0        //Variables used to store the Int value from String 
var D_Rate :Double = 0
var I_Time : Int = 0


extension UIApplication {    //  Quote a structure from UIKit
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension NumberFormatter {  //To use NSNumber in float
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}


func D_trans(t:String) -> Double
{
    var q:Double                    //A funtion that tranforms String to Double
    q = Double(t)!
    return q
}

func I_trans(t:String) -> Int
{
    var q:Int                     //A funtion that tranforms String to Int
    q = Int(t)!
    return q
}
func UnitTransform(Value:Double,Initial:String,Target:String) -> Double    //A function used to transform the unit of rate
{
    var value = Value
    var initial : Double = 0
    var target : Double = 0
    
    switch Initial{
    case "Year" : initial = 360
    case "Month" : initial = 30
    case "Day" : initial = 1
    default : print("I'm so good.Thank you!")
    }
    switch Target{
    case "Year" : target = 360
    case "Month" : target = 30
    case "Day" : target = 1
    default : print("I'm good.Thank you!")
    }
    
    var mid : Double
    mid = target / initial
    
    value = value * mid
    
    
    return value
}

func Final_cal(InitialMoney:Double,WayNum:Int,Rate:Double,RateNum:Int,AdditionMoney:Double,Time:Int)  -> Double
{
    let wayOptions: Array<String> = ["Year","Month","Day"]
    let rateOptions: Array<String> = ["Year","Month","Day"]
  /*  let additionOptions: Array<String> = ["Year","Month","Day"]   */  //AdditionMoney Module is useless for now but may be used in the future.
    var finalMoney: Double = 0
    var rate = Rate
//    var additionMoney = AdditionMoney
    rate = rate/100
    
    let wayOption = wayOptions[WayNum]
    let rateOption = rateOptions[RateNum]
//    let additionOption = additionOptions[AdditionNum]
    if wayOption != rateOption
    {
        rate = UnitTransform(Value:rate,Initial:rateOption,Target:wayOption)
    }
  /*  if wayOption != additionOption
    {
        additionMoney = FactorTransform(Value:additionMoney,Initial:additionOption,Target:wayOption)
    }   */
    
    finalMoney = (InitialMoney * pow( 1 + rate,Double(Time) )) - ((AdditionMoney * (1 + rate) * (1 - pow(1 + rate,Double(Time - 1)))) / rate)
    
    
    return finalMoney
    
}


func Inverse_cal(FinalMoney:Double,WayNum:Int,Rate:Double,RateNum:Int,Time:Int)  -> Double   //Created a new function for calculating initial money on the basics of old Final_cal.
{
    let wayOptions: Array<String> = ["Year","Month","Day"]
    let rateOptions: Array<String> = ["Year","Month","Day"]
    var initialMoney: Double = 0
    var rate = Rate

    rate = rate/100
    
    let wayOption = wayOptions[WayNum]
    let rateOption = rateOptions[RateNum]

    if wayOption != rateOption
    {
        rate = UnitTransform(Value:rate,Initial:rateOption,Target:wayOption)
    }
 
    initialMoney = FinalMoney / pow(1+rate,Double(Time))
    
    return initialMoney
    
}

func Time_cal(FinalMoney:Double,InitialMoney:Double,WayNum:Int,Rate:Double,RateNum:Int)  -> Int  //Created a new function for calculating the time of deposit on the basics of old Final_cal.
{
    let wayOptions: Array<String> = ["Year","Month","Day"]
    let rateOptions: Array<String> = ["Year","Month","Day"]
    var time: Int = 0
    var rate = Rate

    rate = rate/100
    
    let wayOption = wayOptions[WayNum]
    let rateOption = rateOptions[RateNum]

    if wayOption != rateOption
    {
        rate = UnitTransform(Value:rate,Initial:rateOption,Target:wayOption)
    }
 
    //FinalMoney/InitialMoney=(1+rate)^time     time=log(1+rate)(FinalMoney/InitialMoney)=log(FinalMoney/InitialMoney)/log(1+rate)
    time = Int((log(FinalMoney/InitialMoney)/log(1+rate)).rounded())
    return time
    
}

struct Background<Content: View>: View {    //Define a view structure to create the background for the drag gesture
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.clear
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
    }
}


func getLanguageType() -> String {
    let def = UserDefaults.standard
    let allLanguages: [String] = def.object(forKey: "AppleLanguages") as! [String]
    let chooseLanguage = allLanguages.first
    return chooseLanguage ?? "en"
    
}

func translating(source:String) -> String
{
    let language = getLanguageType()
    var result = source
  
    if language.hasPrefix("zh") == false
    {
        if source == "年" {
            result = "Year"
        }
        
        if source == "月" {
            result = "Month"
        }
        if source == "日" {
            result = "Day"
        }
    }
    
   return result
}


