//
//  Customer.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Customer: User {
    
    weak var customerOrderManager: CustomerOrderManagerProtocol?
    weak var customerProductManager: CustomerProductManagerProtocol?
    
    override var description: String {
        return " "
    }
    
}

