//
//  Admin.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Admin: User {
    
    var adminOrderManager: AdminOrderManagerProtocol
    var adminProductManager: AdminProductManagerProtocol
    
    init(name: String, phoneNumber: Int, adminOrderManager: AdminOrderManagerProtocol, adminProductManager: AdminProductManagerProtocol) {
        self.adminOrderManager = adminOrderManager
        self.adminProductManager = adminProductManager
        super.init(name:name, phoneNumber: phoneNumber)
    }
    
    func checkIfProductExist(productName: String) -> Bool {
        return adminProductManager.checkIfProductExist(productName: productName)
    }
    
    func addProduct(productName: String, productCategory: ProductCategory, unitPrice: Double, productQuantity: Int) -> Bool {
        let product: Product = Product(ID: Int.random(in: 1 ... 1000000), name: productName, category: productCategory, price: unitPrice, quantity: productQuantity)
        return adminProductManager.addProduct(product: product)
    }
    
    func removeProduct(productName: String) -> String {
        return adminProductManager.removeProduct(productName: productName)
    }

    func getProducts() {
        
    }
    
    func addDiscount(productName: String, discountPercentage: Double) -> String {
        var discount: Discount = Discount(ID: Int.random(in: 1 ... 1000000), percentage: discountPercentage)
        return adminProductManager.addDiscount(productName: productName, discount: discount)
    }
    
    func removeDiscount(discountID: Int) -> String {
        return adminProductManager.removeDiscount(discountID: discountID)
    }
    
    func viewDiscount() {
        
    }
    
    func listOrders() {
        
    }

}

