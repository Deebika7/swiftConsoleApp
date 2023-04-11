//
//  OrderDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

class OrderDataManager: AdminOrderManagerProtocol, CustomerOrderManagerProtocol {
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
    func addProductToCart(phoneNumber: Int, productName: String, quantity: Int) -> String {
        
        guard let product: Product = databaseManager.getProductFromDB(productName: productName) else {
            return Messages.noProductExist
        }
        
        if !databaseManager.isCartExist(phoneNumber: phoneNumber) {
            databaseManager.createCart(phoneNumber: phoneNumber)
        }
        
        if let cart: [Cart] = databaseManager.getCartFromDB(phoneNumber: phoneNumber) {
            
            if var productFromCart: Cart = databaseManager.getProductFromCart(productName: productName, cart: cart) {
                if product.productQuantity >= productFromCart.cartProduct.productQuantity + quantity {
                    productFromCart.cartQuantity = productFromCart.cartProduct.productQuantity + quantity
                    return Messages.productAddedToCart
                }
                else {
                    return Messages.productOutOfStock
                }
            }
            if product.productQuantity >= quantity {
                databaseManager.addProductToCartDB(phoneNumber: phoneNumber, cart: Cart(quantity: quantity, product: product))
                return Messages.productAddedToCart
            }
            else {
                return Messages.productOutOfStock
            }
        }
        return Messages.noProductExist
    }
    
    private func filterCart(phoneNumber: Int) -> [Cart]? {
        if var cart: [Cart] = databaseManager.getCartFromDB(phoneNumber: phoneNumber) {
            for var (index,  productFromCart) in cart.enumerated() {
                if productFromCart.cartQuantity > productFromCart.cartProduct.productQuantity {
                    if productFromCart.cartProduct.productQuantity == 0 {
                        cart.remove(at: index)
                    }
                    else {
                        productFromCart.cartQuantity = productFromCart.cartProduct.productQuantity
                    }
                }
                if databaseManager.getProductFromDB(productName: productFromCart.cartProduct.productName) == nil {
                    cart.remove(at: index)
                }
            }
            databaseManager.UpdateCartToDB(phoneNumber: phoneNumber, cart: cart)
            return cart
        }
        return nil
    }
    func getCart(phoneNumber: Int) -> [String] {
        var totalAmount: Double = 0
        if let cart: [Cart] = filterCart(phoneNumber: phoneNumber) {
            var cartProducts: [String] = []
            cartProducts.append("==================================================================================================================")

            cartProducts.append("Product Name\t|\tQuantity\t|\tPrice\t|\tTotal Amount\t|\tDiscount Percentage\t|Total Amount After Discount")
            cartProducts.append("==================================================================================================================")

            for productFromCart in cart {
                let discountPercentage: Double = databaseManager.getDiscountFromDB(productName: productFromCart.cartProduct.productName)?.discountPercentage ?? 0
                var price: Double = 0
                if discountPercentage != 0 {
                    price = calculatePrice(productPrice: productFromCart.cartProduct.productPrice, discountPercentage: discountPercentage)
                }
                else {
                    price = productFromCart.cartProduct.productPrice
                }
                cartProducts.append("\(productFromCart.cartProduct.productName)\t\t\t\t \(productFromCart.cartQuantity)\t\t\t\t\(productFromCart.cartProduct.productPrice)\t\t\t\t\(Double(productFromCart.cartQuantity) * productFromCart.cartProduct.productPrice)\t\t\t\t\t\(discountPercentage)\t\t\t\t\t\t\t \(Double(productFromCart.cartQuantity) * price)")
                totalAmount += Double(productFromCart.cartQuantity) * price
            }
            cartProducts.append("\n");
            cartProducts.append("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTotal Amount:  \(totalAmount)");
            cartProducts.append("==================================================================================================================")
            return cartProducts
        }
        return []
    }
    
    private func calculatePrice(productPrice: Double, discountPercentage: Double) -> Double {
        productPrice - (productPrice * (discountPercentage / 100))
    }
    
    func removeProductFromCart(phoneNumber: Int, productName: String) -> String {
        if var cart: [Cart] = databaseManager.getCartFromDB(phoneNumber: phoneNumber) {
            if let _: Cart = databaseManager.getProductFromCart(productName: productName, cart: cart) {
                for (index, productFromCart) in cart.enumerated() {
                    if productFromCart.cartProduct.productName == productName {
                        cart.remove(at: index)
                        return Messages.productRemovedFromCart
                    }
                }
                databaseManager.UpdateCartToDB(phoneNumber: phoneNumber, cart: cart)
            }
        }
        return Messages.noCartExist
    }
    
    func clearCart(phoneNumber: Int) {
        databaseManager.removeCartFromCartDB(phoneNumber: phoneNumber)
    }
    
    func addToOrders(customer: Customer) {
        if let cart: [Cart] = databaseManager.getCartFromDB(phoneNumber: customer.getPhoneNumber) {
            databaseManager.addOrdersToDB(phoneNumber: customer.getPhoneNumber, order: Order(customer: customer, cart: databaseManager.getCartFromDB(phoneNumber: customer.getPhoneNumber) ?? [] ))
        }
    }
    
     func placeOrder(phoneNumber: Int) -> String {
        if let cart: [Cart] = databaseManager.getCartFromDB(phoneNumber: phoneNumber) {
            cart.forEach{
                if var product: Product = databaseManager.getProductFromDB(productName: $0.cartProduct.productName) {
                    var quantity: Int = product.productQuantity - $0.cartProduct.productQuantity
                    databaseManager.updateProductQuantity(product: product, quantity: quantity)
                }
            }
        }
        return Messages.orderplaced
    }
    
    
    
    func getAllOrders() -> [Int: Order] {
        databaseManager.getAllOrdersFromDB()
    }
}
