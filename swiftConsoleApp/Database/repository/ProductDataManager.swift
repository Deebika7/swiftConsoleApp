//
//  ProductDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

class ProductDataManager: AdminOrderManagerProtocol, AdminProductManagerProtocol {
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
    func addProduct(product: Product) -> Bool {
        if databaseManager.isProductExistInDB(productName: product.productName) {
            databaseManager.addProductToDB(productName: product.productName, product: product)
            return true
        }
        return false
    }
    
    func removeProduct(productName: String) -> String {
        if databaseManager.isProductExistInDB(productName: productName) {
            databaseManager.removeProductFromDB(productName: productName)
            return Messages.productRemoved
        }
        return Messages.noProductExist
    }
    
    func addDiscount(productName: String, discount: Discount) -> String {
        return ""
    }
    
    func removeDiscount(discountID: Int) -> String {
        return ""
    }
    
}
