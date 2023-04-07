//
//  ProductDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

class ProductDataManager: AdminProductManagerProtocol, CustomerProductManagerProtocol {
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
    func checkIfProductExist(productName: String) -> Bool {
        return databaseManager.isProductExistInDB(productName: productName)
    }
    
    func addProduct(product: Product) -> Bool {
        if !databaseManager.isProductExistInDB(productName: product.productName) {
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
        if databaseManager.isDiscountExistInDB(productName: productName) {
            return Messages.discountAlreadyExist
        }
        databaseManager.addDiscountToDB(productName: productName, discount: discount)
        return Messages.discounAdded
    }
    
    func removeDiscount(discountID: Int) -> String {
        return databaseManager.removeDiscountFromDB(discountID: discountID)
    }
    
    func isDiscountExist(productName: String) -> Bool {
        return databaseManager.isDiscountExistInDB(productName: productName)
    }
}
