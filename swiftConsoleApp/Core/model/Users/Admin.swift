//
//  Admin.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

class Admin: User {
    
    weak var adminOrderManager: AdminOrderManagerProtocol?
    weak var adminProductManager: AdminProductManagerProtocol?
    
    func addProduct(productName: String, productCategory: ProductCategory, unitPrice: Double, productQuantity: Int) -> Bool? {
        let product: Product = Product(ID: Int.random(in: 1 ... 1000000), name: productName, category: productCategory, price: unitPrice, quantity: productQuantity)
        return adminProductManager?.addProduct(product: product)
            
    }
    
    func removeProduct(productName: String) -> String? {
        return adminProductManager?.removeProduct(productName: productName)
    }

    func viewProducts() {
        
    }
    
    func addDiscount(productName: String, discountPercentage: Double) -> String? {
        var discount: Discount = Discount(ID: Int.random(in: 1 ... 1000000) , percentage: discountPercentage)
        return adminProductManager?.addDiscount(productName: productName, discount: discount)
    }
    
    func removeDiscount(DiscountID: Int) -> String {
        return ""
    }
    
    func viewDiscount() {
        
    }
    
    func listOrders() {
        
    }
    
    

    
}

