//
//  Order.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

struct Order {
    private let customer: Customer
    private let cart: [Cart]
    
    init(customer: Customer, cart: [Cart]){
        self.customer = customer
        self.cart = cart
    }
    public var getCustomer: Customer {
        return self.customer
    }
    
    public var getCart: [Cart] {
        return self.cart
    }
}


