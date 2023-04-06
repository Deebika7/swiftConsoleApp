//
//  main.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//


private let menu = LoginMenu()
var mainMenuLoop: Bool = true
 while(mainMenuLoop){
    
    print("------------------------------------------------------------------------------------------")
    
    print("welcome!")
    
    print("------------------------------------------------------------------------------------------")

    for (index,value) in LoginOptions.allCases.enumerated() {
        print("\(index + 1). \(value.rawValue)")
    }
    
    print("------------------------------------------------------------------------------------------")
    
    print("Enter your preference [1 to \(LoginOptions.allCases.count)] ")
    
     let preference: Int = InputUtil.getValidNumberInput(minValue: 1,maxValue: LoginOptions.allCases.count)
     let preferenceEnum = LoginOptions.allCases[preference - 1]
    switch preferenceEnum {
    case .signIn:
        LoginMenu().signIn()
    case .signUp:
        LoginMenu().signUp()
    case .quit:
        mainMenuLoop = false
    default:
        print("invalid input")
    }
     
}
