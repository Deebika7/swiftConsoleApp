//
//  Product.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

struct Product {
    private let productName: String
    private let productID: Int
    private var productPrice: Double {
        get {
            return productPrice
        }
        set {
            productPrice = newValue
        }
    }
    private var productQuantity: Int {
        get {
            return productQuantity
        }
        set {
            productQuantity = newValue
        }
    }
    private let productCategory: ProductCategory
}



