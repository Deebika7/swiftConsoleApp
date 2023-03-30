//
//  DatabaseManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

class DatabaseManager {
    
    private var DBInstance = MainDatabase()
    
    private init() {}
    
    static var DBManagerInstance = DatabaseManager()
    
    
    //user functions
    func addPhoneNumberAndPasswordToDB(phoneNumber: Int, password: String) {
        DBInstance.accountDb[phoneNumber] = password
    }
    
    func isUserExistInDB(phoneNumber: Int) -> Bool {
        return DBInstance.accountDb.keys.contains(phoneNumber)
    }
    
    func getUserPasswordFromDB(phoneNumber: Int) -> String? {
        guard let password = DBInstance.accountDb[phoneNumber] else{
            return nil
        }
        return password
    }
    
    func addUserToUserDB(phoneNumber: Int, user: User) {
        DBInstance.userDb[phoneNumber] = user
    }
    
    //product functions
    func addProductToDB(productName: String, product: Product) {
        DBInstance.productDb[productName] = product
    }
    
    func removeProductFromDB(productName: String) {
        DBInstance.productDb.removeValue(forKey: productName)
    }
    
    func isProductExistInDB(productName: String) -> Bool {
        return DBInstance.productDb.keys.contains(productName)
    }

    func getProductFromDB(productName: String) -> Product? {
        guard isProductExistInDB(productName: productName) else {
            return nil
        }
        return DBInstance.productDb[productName]
    }
    
    func getAllProductsFromDB() -> [Product] {
        return Array(DBInstance.productDb.values)
    }
    
    //discount functions
    func addDiscountToDB(productName: String, discount: Discount) {
        DBInstance.discountDb[productName] = discount
    }
    
    func removeDiscountFromDB(productName: String) {
        DBInstance.productDb.removeValue(forKey: productName)
    }
    
    func isDiscountExistInDB(productName: String) -> Bool {
        return DBInstance.productDb.keys.contains(productName)
    }
    
    func getDiscountsFromDB() -> [Discount] {
        return Array(DBInstance.discountDb.values)
    }
    
    func getDiscountFromDB(productName: String) -> Discount? {
        guard isDiscountExistInDB(productName: productName) else {
            return nil
        }
        return DBInstance.discountDb[productName]
    }
    //order functions
    func getAllOrdersFromDB() -> [Order] {
        return Array(DBInstance.orderDb.values)
    }
    
    //cart functions
    func addProductToCartDB<T: CustomStringConvertible>(product: Product) -> [T] {
        return []
    }
    
    func removeProductFromCartDB() {
        
    }
    
    func getCartFromDB()  {
        
    }
    
    func UpdateCartToDB() -> () {
        
    }
}


