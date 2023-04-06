//
//  Util.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

import Foundation

struct InputUtil {
    
    static func getValidIntegerInput() -> Int {
        print(">> " , terminator: "")
        if let integer = Int(readLine()!) {
            return integer
        }
        else {
            print("Enter a valid integer")
            return getValidIntegerInput()
        }
    }
    
    static func getValidStringInput() -> String {
        print(">> " , terminator: "")
        let string = readLine()!
        if string.range(of: #"^[a-zA-Z ]{3}$"#, options: .regularExpression) != nil {
            return string
        }
        print("Enter characters alone!")
        return getValidStringInput()
    }
    
    static func getValidNumberInput(minValue: Int, maxValue: Int) -> Int {
        let integerInput = getValidIntegerInput()
        if( (minValue <= integerInput) && (integerInput <= maxValue) ) {
            return integerInput
        }
        else {
            print("Enter an option between  1 to \(maxValue)")
            return getValidNumberInput(minValue: 1, maxValue: maxValue)
        }
    }
    
    static func getValidphoneNumber() -> Int {
        print("phone number should start between [7-9] & must contain 10 digits")
        let input: String = String(getValidIntegerInput())
        let phoneNumber = String(input)
        guard phoneNumber.range(of: #"^(0|91)?[7-9][0-9]{9}$"#, options: .regularExpression) != nil else {
            return getValidphoneNumber()
        }
        return Int(phoneNumber)!
    }
    
    static func getValidPassword() -> String {
        print("password must have minimum 8 characters at least and 1 Number")
        let input: String = readLine()!
        guard input.range(of: #"^(?=.*\d)[a-zA-z0-9]{8,10}$"#, options: .regularExpression) != nil else {
            return getValidPassword()
        }
        return input
    }
    
    static func verifyConfirmPassword(password: String) -> Bool {
        print(">> " , terminator: "")
        let input: String = readLine()!
        if input != password  {
            print("password doesn't match try again! or press 1 to quit")
            if input == "1" {
                return false
            }
            return verifyConfirmPassword(password: password)
        }
        return true
    }
    
    static func getValidDoubleInput() -> Double {
        print(">> " , terminator: "")
        if let input: Double = Double(readLine()!) {
            return input
        }
        print("Enter valid input")
        return getValidDoubleInput()
    }
    
    static func getValidDiscountPercentage() -> Double {
        print(">> " , terminator: "")
        print("Discount percentage must be between 0 to 100")
        let input: Double = getValidDoubleInput()
        if input <= 0 && input > 100 {
            return input
        }
        return getValidDiscountPercentage()
    }
    
    static func getValidPrice() -> Double {
        print("product quantity value should be greater than 0")
        print(">> " , terminator: "")
        let input: Double = getValidDoubleInput()
        if  input > 0 {
            return input
        }
        return getValidPrice()
    }
    
    static func getValidProductQuantity() -> Int {
        print("product quantity value should be greater than 0")
        let input: Int = getValidIntegerInput()
        if  input > 0 {
            return input
        }
        return getValidProductQuantity()
    }

}

