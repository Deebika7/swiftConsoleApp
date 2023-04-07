//
//  Customer.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Customer: User {
    
    var customerOrderManager: CustomerOrderManagerProtocol
    var customerProductManager: CustomerProductManagerProtocol
    
    init(name: String, phoneNumber: Int, customerOrderManager: CustomerOrderManagerProtocol, customerProductManager: CustomerProductManagerProtocol) {
        self.customerOrderManager = customerOrderManager
        self.customerProductManager = customerProductManager
        super.init(name:name, phoneNumber: phoneNumber)
    }
    
    override var description: String {
        return " "
    }
    
}

