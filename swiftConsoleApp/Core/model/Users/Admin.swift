//
//  Admin.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Admin: User {
    
    private var adminOrderManager: AdminOrderManagerProtocol
    private var adminProductManager: AdminProductManagerProtocol
    
    init(name: String, phoneNumber: Int, adminOrderManager: AdminOrderManagerProtocol, adminProductManager: AdminProductManagerProtocol) {
        self.adminOrderManager = adminOrderManager
        self.adminProductManager = adminProductManager
        super.init(name:name, phoneNumber: phoneNumber)
    }
    
    func checkIfProductExist(productName: String) -> Bool {
        adminProductManager.checkIfProductExist(productName: productName)
    }
    
    func addProduct(productName: String, productCategory: ProductCategory, unitPrice: Double, productQuantity: Int) -> Bool {
        let product: Product = Product(ID: Int.random(in: 1 ... 1000000), name: productName, category: productCategory, price: unitPrice, quantity: productQuantity)
        return adminProductManager.addProduct(product: product)
    }
    
    func removeProduct(productName: String) -> String {
        adminProductManager.removeDiscount(productName: productName)
        return adminProductManager.removeProduct(productName: productName)
    }

    func getProducts() -> [Product] {
        adminProductManager.getAllProduct()
    }
    
    func addDiscount(productName: String, discountPercentage: Double) -> String {
        let discount: Discount = Discount(ID: Int.random(in: 1 ... 1000000), percentage: discountPercentage)
        return adminProductManager.addDiscount(productName: productName, discount: discount)
    }
    
    func removeDiscount(productName: String) -> String {
        adminProductManager.removeDiscount(productName: productName)
    }
    
    func getDiscounts() -> [String: Discount] {
        adminProductManager.getAllDiscount()
    }
    
    func listOrders() -> [String] {
        var orders: [Int: Order] = adminOrderManager.getAllOrders()
        var allOrders: [String] = []
        if orders.isEmpty {
            allOrders.append("no orders placed yet")
        }
        else {
            for order in orders {
                allOrders.append("Customer PhoneNumber: \(order.key)")
                allOrders.append("Customer Name: \(order.value.getCustomer.getName)")
                allOrders.append("\(order.value.getCart)")
            }
        }
        return allOrders
    }

}

