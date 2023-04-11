//
//  ProductDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

class ProductDataManager: AdminProductManagerProtocol, CustomerProductManagerProtocol {
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
//    init() {
//        databaseManager.addProductToDB(productName: "milk", product:Product(ID: Int.random(in: 1 ... 1000000), name: "milk", category: ProductCategory.dairy, price: 12, quantity: 3) )
//        databaseManager.addProductToDB(productName: "sauce", product:Product(ID: Int.random(in: 1 ... 1000000), name: "sauce", category: ProductCategory.sause, price: 12, quantity: 3) )
//        databaseManager.addProductToDB(productName: "detegerent", product:Product(ID: Int.random(in: 1 ... 1000000), name: "detegerent", category: ProductCategory.cleaning, price: 12, quantity: 3) )
//        databaseManager.addProductToDB(productName: "clove", product:Product(ID: Int.random(in: 1 ... 1000000), name: "clove", category: ProductCategory.spice, price: 12, quantity: 3) )
//        databaseManager.addProductToDB(productName: "cheese", product:Product(ID: Int.random(in: 1 ... 1000000), name: "cheese", category: ProductCategory.dairy, price: 12, quantity: 3) )
//        databaseManager.addProductToDB(productName: "soap", product:Product(ID: Int.random(in: 1 ... 1000000), name: "soap", category: ProductCategory.cleaning, price: 12, quantity: 3) )
//        databaseManager.addProductToDB(productName: "ketchup", product:Product(ID: Int.random(in: 1 ... 1000000), name: "ketchup", category: ProductCategory.dairy, price: 12, quantity: 3) )
//    }
    
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
    
    func getAllDiscount() -> [String: Discount] {
        databaseManager.getDiscountsFromDB()
    }
    
}
