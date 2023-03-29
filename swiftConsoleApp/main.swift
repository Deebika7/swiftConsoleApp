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
    
    print("Enter your preference:")
    let preference: Int
    
    switch preference {
    case 1:
        menu.signIn()
    case 2:
        menu.signUp()
    case 3:
        break MainLoop
    default:
        print("invalid input")
    }
}
