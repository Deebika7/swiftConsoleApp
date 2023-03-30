//
//  main.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//


private let menu = LoginMenu()
MainLoop: while(true){
    
    print("------------------------------------------------------------------------------------------")
    
    print("welcome!")
    
    print("------------------------------------------------------------------------------------------")

    for options in LoginOptions.allCases.enumerated() {
        print("\(options.element.rawValue). \(options.element)")
    }
    
    print("------------------------------------------------------------------------------------------")
    
    print("Enter your preference [1 to \(LoginOptions.allCases.count)] ")
    
    let preference: Int = Validator.getValidSwitchInput(maxValue: LoginOptions.allCases.count)
    
    switch preference {
    case 1:
        print("1")
    case 2:
        print("2")
    case 3:
        break MainLoop
    default:
        print("invalid input")
    }
}
