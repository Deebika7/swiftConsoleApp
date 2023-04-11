//
//  CustomerOrderManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

protocol CustomerOrderManagerProtocol: AnyObject {
    func addProductToCart(phoneNumber: Int, productName: String, quantity: Int) -> String
    func getCart(phoneNumber: Int) -> [String]
    func removeProductFromCart(phoneNumber: Int, productName: String) -> String
    func clearCart(phoneNumber: Int)
    func addToOrders(customer: Customer)
    func placeOrder(phoneNumber: Int) -> String
}
