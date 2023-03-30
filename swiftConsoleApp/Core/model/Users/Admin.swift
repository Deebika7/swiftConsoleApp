//
//  Admin.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Admin: User, CustomStringConvertible {
    
    weak var customerOrderManager: CustomerOrderManager?
    weak var customerProductManager: CustomerProductManager?
    
    var description: String {
        return " "
    }
    
}

