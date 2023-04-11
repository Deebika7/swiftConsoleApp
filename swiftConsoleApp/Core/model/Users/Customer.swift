//
//  Customer.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Customer: User {
    
    private var customerOrderManager: CustomerOrderManagerProtocol
    private var customerProductManager: CustomerProductManagerProtocol
    
    init(name: String, phoneNumber: Int, customerOrderManager: CustomerOrderManagerProtocol, customerProductManager: CustomerProductManagerProtocol) {
        self.customerOrderManager = customerOrderManager
        self.customerProductManager = customerProductManager
        super.init(name:name, phoneNumber: phoneNumber)
    }
    
    override var description: String {
        return " "
    }
    
    func getDiscounts() -> [String: Discount] {
        customerProductManager.getAllDiscount()
    }
    
    func getProducts() -> [Product] {
        customerProductManager.getAllProduct()
    }
    
    func addProductToCart(productName: String, productQuantity: Int) -> String {
        return customerOrderManager.addProductToCart(phoneNumber: self.getPhoneNumber, productName: productName, quantity: productQuantity)
    }
    
    func getCart() -> [String] {
        return customerOrderManager.getCart(phoneNumber: self.getPhoneNumber)
    }
    
    func removeProductFromCart(productName: String) -> String {
        return customerOrderManager.removeProductFromCart(phoneNumber: self.getPhoneNumber, productName: productName)
    }
    
    func clearCart(phoneNumber: Int) {
        customerOrderManager.clearCart(phoneNumber: phoneNumber)
    }
    
    func checkIfProductExist(productName: String) -> Bool {
        customerProductManager.checkIfProductExist(productName: productName)
    }
        

    func placeOrder() -> String {
        customerOrderManager.addToOrders(customer: self)
        let message: String = customerOrderManager.placeOrder(phoneNumber: self.getPhoneNumber)
        customerOrderManager.clearCart(phoneNumber: self.getPhoneNumber)
        return message
    }
}

