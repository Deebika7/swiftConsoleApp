//
//  Customer.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Customer: User, CustomStringConvertible {
    
    weak var adminOrderManager: AdminOrderManager?
    weak var adminProductManager: AdminProductManager?
    
    var description: String {
        return " "
    }
    
}

