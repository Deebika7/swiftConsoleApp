//
//  main.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//



MainLoop: while(true){
    
    print("------------------------------------------------------------------------------------------")
    
    print("welcome to Super Market")
    
    print("------------------------------------------------------------------------------------------")

    for options in LoginOptions.allCases.enumerated(){
        print("\(options.element.rawValue). \(options.element)")
    }
    
    print("------------------------------------------------------------------------------------------")
    
    print("Enter your preference:")
    let preference: Int
    
    switch preference {
    case 1:
        
    case 2:
        
    case 3:
        break MainLoop
    default:
        print("invalid input")
    }
}
