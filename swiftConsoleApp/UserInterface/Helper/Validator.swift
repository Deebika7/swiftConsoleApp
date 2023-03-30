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
    
    static func getValidphoneNumber() -> Int {
        print("phone number should start between [7-9] & must contain 10 digits")
        let input: Int = Util.getValidIntegerInput()
        let phoneNumber = String(input)
        guard phoneNumber.firstMatch(of: /(0|91)?[7-9][0-9]{9}/) != nil else {
            return getValidphoneNumber()
        }
        return Int(phoneNumber)!
    }
    
    static func getValidPassword() -> String {
        print("password must have minimum 8 characters at least and 1 Number")
        print(">> " , terminator: "")
        let input = readLine()!
        guard input.firstMatch(of: /(?=.*\d)[a-zA-z0-9]{8,10}/) != nil else {
            return getValidPassword()
        }
        return input
    }
    
    static func confirmPasswordVerifier(password: String) {
        print(">> " , terminator: "")
        let input = readLine()!
        guard input == password else {
            print("password doesn't match try again!")
            return confirmPasswordVerifier(password: password)
        }
    }
    
    static func getValidStringInput() -> String {
        print(">> " , terminator: "")
        let string = readLine()!
        guard  string.firstMatch(of: /[a-zA-Z ]/) != nil else {
            print("Enter characters alone!")
            return getValidStringInput()
        }
        return string
    }
    
    
    
}
