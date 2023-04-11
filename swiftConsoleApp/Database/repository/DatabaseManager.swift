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
    
    func updateProductQuantity(product: Product, quantity: Int) {
        removeProductFromDB(productName: product.productName)
        addProductToDB(productName: product.productName, product: Product(ID: product.productID, name: product.productName, category: product.productCategory, price: product.productPrice, quantity: quantity))
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
    
    func createCart(phoneNumber: Int) {
        DBInstance.cartDb[phoneNumber] = []
    }
    
    func getProductFromCart(productName: String, cart: [Cart]) -> Cart? {
        for cartProduct in cart {
            if(cartProduct.cartProduct.productName == productName){
                return cartProduct
            }
        }
        return nil
    }
    
    func addProductToCartDB(phoneNumber: Int, cart: Cart){
        DBInstance.cartDb[phoneNumber]?.append(cart)
    }
    
    func removeCartFromCartDB(phoneNumber: Int) {
        DBInstance.cartDb.removeValue(forKey: phoneNumber)
    }
    
    func getCartFromDB(phoneNumber: Int) -> [Cart]? {
        Array(DBInstance.cartDb[phoneNumber] ?? [])
    }
    
    func UpdateCartToDB(phoneNumber: Int, cart: [Cart])
    {
        removeCartFromCartDB(phoneNumber: phoneNumber)
        DBInstance.cartDb[phoneNumber] = cart
    }
    
    func isCartExist(phoneNumber: Int) -> Bool {
        DBInstance.cartDb.keys.contains(phoneNumber)
    }
    
    func addOrdersToDB(phoneNumber: Int, order: Order) {
        DBInstance.orderDb[phoneNumber] = order
    }
    
    func getAllOrdersFromDB() -> [Int: Order] {
        DBInstance.orderDb
    }
}


