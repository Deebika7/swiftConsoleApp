//
//  Order.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

struct Order {
    private let customer: Customer
    private let cart: [String]
    
    init(customer: Customer, cart: [String]){
        self.customer = customer
        self.cart = cart
    }
    public var getCustomer: Customer {
        return self.customer
    }
    
    public var getCart: [String] {
        return self.cart
    }
}


