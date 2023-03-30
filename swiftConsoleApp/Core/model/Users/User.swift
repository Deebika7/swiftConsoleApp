//
//  User.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class User: CustomStringConvertible {
    var description: String {
        return "Name: \(name) phoneNumber: \(phoneNumber)"
    }
    
    
    private let phoneNumber: Int
    private let name: String
    
    init(name: String, phoneNumber: Int) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
   
    
}


