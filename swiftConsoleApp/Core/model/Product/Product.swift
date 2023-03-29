//
//  Product.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

struct Product {
    
    private let ID: Int
    private let name: String
    private let category: ProductCategory
    private var price: Double
    private var quantity: Int
    
    public var productID: Int {
        get {
            return self.ID
        }
    }
    
    public var productName: String {
        get {
            return self.name
        }
    }
    
    public var productCategory: ProductCategory {
        get {
            return self.category
        }
    }
    
    public var productPrice: Double {
        get {
            return self.price
        }
        set {
            self.price = newValue
        }
    }
    
    public var productQuantity: Int {
        get {
            return self.quantity
        }
        set {
            self.quantity = newValue
        }
    }
    
    init(productID: Int, productName: String, productPrice: Double, productQuantity: Int) {
        self.productID = productID
        self.productName = productName
        self.productPrice = productPrice
        self.productQuantity = productQuantity
    }
    
}



