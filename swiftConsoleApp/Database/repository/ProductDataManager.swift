//
//  ProductDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

class ProductDataManager: AdminProductManagerProtocol, CustomerProductManagerProtocol {
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
    func checkIfProductExist(productName: String) -> Bool {
        databaseManager.isProductExistInDB(productName: productName)
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
    
    func removeDiscount(productName: String) -> String {
        if databaseManager.isDiscountExistInDB(productName: productName) {
            databaseManager.removeDiscountFromDB(productName: productName)
            return Messages.discountRemoved
        }
        return Messages.noDiscountExist
    }
    
    func isDiscountExist(productName: String) -> Bool {
        databaseManager.isDiscountExistInDB(productName: productName)
    }
    
    func getAllProduct() -> [Product] {
        databaseManager.getAllProductsFromDB()
    }
    
    func getAllDiscount() -> [String:Discount] {
        databaseManager.getDiscountsFromDB()
    }
}
