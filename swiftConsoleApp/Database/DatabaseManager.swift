//
//  DatabaseManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

class DatabaseManager {
    
    private let DBInstance = MainDatabase()
    
    private init() {}
    
    private let DBManagerInstance = DatabaseManager()
    
    static func getDBManagerInstance<T:DatabaseManager>() -> T {
        return DBManagerInstance
    }
    
    //user functions
    func addPhoneNumberAndPasswordToDB(phoneNumber: Int, password: String){
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
        DBInstance.userDb[phoneNumber] = User
    }
    
    //product functions
    func addProductToDB(productName: String, product: Product) {
        DBInstance.productDb[productName] = Product
    }
    
    func removeProductFromDB(productName: String) {
        DBInstance.productDb.removeValue(forKey: productName)
    }
    
    func isProductExistInDB(productName: String) -> Bool {
        return DBInstance.productDb.keys.contains(productName)
    }
    
    func getProductFromDB<Product>(productName: String) -> Product? {
        guard isProductExist(productName) else {
            return nil
        }
        return DBInstance.productDb[productName]
    }
    
    func getAllProductsFromDB() -> [Product] {
        return DBInstance.productDb.values
    }
    
    //discount functions
    func addDiscountToDB(productName: String, discount: Discount) {
        DBInstance.discountDb[productName] = Discount
    }
    
    func removeDiscountFromDB(productName: String) {
        DBInstance.productDb.removeValue(forKey: productName)
    }
    
    func isDiscountExistInDB(productName: String) -> Bool {
        return DBInstance.productDb.keys.contains(productName)
    }
    func getDiscountsFromDB() -> [Discount] {
        return DBInstance.discountDb.values
    }
    func getDiscountFromDB(productName: String) -> Discount {
        guard isDiscountExist(productName) else {
            return nil
        }
        return DBInstance.discountDb[productName]
    }
    //order functions
    func getAllOrdersFromDB() -> [Order] {
        return DBInstance.orderDb.values
    }
    //cart functions
    func addProductToCartDB(cart Cart) -> [Cart] {
        
    }
    
    func removeProductFromCartDB(parameters) -> return type {
        
    }
    
    func getCartFromDB(parameters) -> return type {
        
    }
    
    func UpdateCartToDB() -> () {
        
    }
}


