//
//  Validator.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct Validator {
    static func getValidSwitchInput(maxValue: Int) -> Int {
        let input = Util.getValidIntegerInput()
        if( (0 < input) && (input <= maxValue) ) {
            return input
        }
        else {
            print("Enter an option between  1 to \(maxValue)")
            return getValidSwitchInput(maxValue: maxValue)
        }
    }
}
