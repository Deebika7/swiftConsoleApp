//
//  Cart.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

struct Cart {
    private var quantity: Int
    private var product: Product
    
    init(quantity: Int, product: Product) {
        self.quantity = quantity
        self.product = product
    }
    
    public var cartQuantity: Int {
        get {
            return self.quantity
        }
        set {
            self.quantity = newValue
        }
    }
    
    public var cartProduct: Product {
        get {
            return self.product
        }
    }
}

