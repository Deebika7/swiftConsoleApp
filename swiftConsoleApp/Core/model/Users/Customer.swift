//
//  Customer.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Customer: User {
    
    weak var adminOrderManager: AdminOrderManager?
    weak var adminProductManager: AdminProductManager?
    
    override var description: String {
        return " "
    }
    
}

