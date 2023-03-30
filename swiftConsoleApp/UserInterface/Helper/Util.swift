//
//  Util.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

struct Util {
    
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
        if let string = readLine(){
                return string
            }
        else{
            print("Enter characters alone!")
            return getValidStringInput()
        }
    }

}
