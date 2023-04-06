//
//  ProductDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

class ProductDataManager: AdminOrderManagerProtocol, AdminProductManagerProtocol {
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
    func addProduct(product: Product) -> String {
        if databaseManager.isProductExistInDB(productName: product.productName) {
            return Messages.productAlreadyExist
        }
        databaseManager.addProductToDB(productName: product.productName, product: product)
        return Messages.productAddedSuccessfully
    }
    
    func removeProduct(productName: String) -> String {
        return ""
    }
    
    func addDiscount(productName: String, discount: Discount) -> String {
        return ""
    }
    
    func removeDiscount(discountID: Int) -> String {
        return ""
    }
    
}
