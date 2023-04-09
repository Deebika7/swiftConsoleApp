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
        DBInstance.accountDb.keys.contains(phoneNumber)
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
    
    func getUserFromDB(phoneNumber: Int) -> User? {
        DBInstance.userDb[phoneNumber]
    }
    
    //product functions
    func addProductToDB(productName: String, product: Product) {
        DBInstance.productDb[productName] = product
    }
    
    func removeProductFromDB(productName: String) {
        DBInstance.productDb.removeValue(forKey: productName)
    }
    
    func isProductExistInDB(productName: String) -> Bool {
        DBInstance.productDb.keys.contains(productName)
    }

    func getProductFromDB(productName: String) -> Product? {
        if isProductExistInDB(productName: productName)  {
            return DBInstance.productDb[productName]
        }
        return nil
    }
    
    func getAllProductsFromDB() -> [Product] {
        Array(DBInstance.productDb.values)
    }
    
    //discount functions
    func addDiscountToDB(productName: String, discount: Discount) {
        DBInstance.discountDb[productName] = discount
    }
    
    func removeDiscountFromDB(productName: String) {
        DBInstance.discountDb.removeValue(forKey: productName)
    }
    
    func isDiscountExistInDB(productName: String) -> Bool {
        DBInstance.discountDb.keys.contains(productName)
    }
    
    func getDiscountsFromDB() -> [String:Discount] {
        DBInstance.discountDb
    }
    
    func getDiscountFromDB(productName: String) -> Discount? {
        guard isDiscountExistInDB(productName: productName) else {
            return nil
        }
        return DBInstance.discountDb[productName]
    }
    
    //order functions
    func getAllOrdersFromDB() -> [Order] {
        Array(DBInstance.orderDb.values)
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


