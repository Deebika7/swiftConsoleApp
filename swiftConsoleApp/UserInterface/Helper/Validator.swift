//
//  Validator.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct Validator {
    
    static func getValidSwitchInput(maxValue: Int) -> Int {
        let integerInput = Util.getValidIntegerInput()
        if( (0 < integerInput) && (integerInput <= maxValue) ) {
            return integerInput
        }
        else {
            print("Enter an option between  1 to \(maxValue)")
            return getValidSwitchInput(maxValue: maxValue)
        }
    }
    
    static func getValidphoneNumber() -> String {
        print("phone number should start between [7-9] & must contain 10 digits")
        let input = Util.getValidIntegerInput()
        let phoneNumber = String(input).range(
            of: "(0|91)?[7-9][0-9]{9}",
            options: .regularExpression
        )
        if(phoneNumber != nil) {
            return String(input)
        }
        else {
            return getValidphoneNumber()
        }
    }
    
}
