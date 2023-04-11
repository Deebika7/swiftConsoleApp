//
//  CustomerMenu.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct CustomerMenu {
    var customer: Customer
    init(customer: Customer) {
        self.customer = customer
    }
    func displayCustomerMenu() {
        while(true) {
            print("------------------------------------------------------------------------------------------")
            
            for (index,value) in CustomerOptions.allCases.enumerated() {
                print("\(index + 1 ). \(value.rawValue)")
            }
            
            print("------------------------------------------------------------------------------------------")
            
            print("Enter your preference [1 to \(CustomerOptions.allCases.count)] ")
            
            let preference: Int = InputUtil.getValidNumberInput(minValue: 1, maxValue: CustomerOptions.allCases.count)
            
            let preferenceEnum = CustomerOptions.allCases[preference - 1]
            
            switch preferenceEnum {
            case .viewProducts:
                viewProducts()
            case .checkDiscount:
                viewDiscount()
            case .viewCart:
                viewCart()
            case .addProductToCart:
                addProductToCart()
            case .removeProductFromCart:
                removeProductFromCart()
            case .quit:
                logout()
                return
            default:
                print("invalid input")
            }
        }
    }
   
    func logout() {
        print("Thank You!")
    }
    
    func printProductCategory() {
        for (index, value) in ProductCategory.allCases.enumerated() {
            print("\(index + 1). \(value.rawValue)")
        }
    }
    
    func viewProducts() -> Bool {
        guard !customer.getProducts().isEmpty else {
            print(Messages.noProductExist)
            return false
        }
        var moreProducts: String = "y"
        while(moreProducts == "y" || moreProducts == "Y") {
            print("Select category to view products")
            printProductCategory()
            let productPreference: Int = InputUtil.getValidNumberInput(minValue: 1, maxValue: ProductCategory.allCases.count)
            let productPreferenceEnum: ProductCategory = ProductCategory.allCases[productPreference - 1]
            let products: [Product] = customer.getProducts()
            print("==========================\t\(productPreferenceEnum)\t================================================")
            print("=====================================================================================");
            print("Product ID\t|\tProduct Name\t|\tunit price\t|\tAvailable quantity");
            print("=====================================================================================");
            products.filter { $0.productCategory == productPreferenceEnum }.forEach{
                print("\($0.productID)\t\t\t\($0.productName)\t\t\t\t\t\($0.productPrice)\t\t\t\t\($0.productQuantity)")
            }
            print("Would you like to view more products? [Y/y] or type anything to exit")
            moreProducts = InputUtil.getValidStringInput()
        }
        return true
    }
    
    func viewDiscount() {
        guard !customer.getDiscounts().isEmpty else {
            print(Messages.noDiscountExist)
            return
        }
        let discounts: [String: Discount] = customer.getDiscounts()
        discounts.forEach{ discount in
            print("=========================================================")
            print("Discount ID\t|\tProduct Name\t|\tDiscount Percentage")
            print("=========================================================")
            print("\(discount.value.discountID)\t\t\t\(discount.key)\t\t\t\t\t\(discount.value.discountPercentage)")
            print("=========================================================")
        }
    }
    
    func addProductToCart() {
        guard viewProducts() else {
            return
        }
        print("Enter product name to add to cart")
        let productName: String = InputUtil.getValidStringInput()
        guard customer.checkIfProductExist(productName: productName) else {
            print(Messages.noProductExist)
            return
        }
        print("Enter quantity ")
        let productQuantity: Int = InputUtil.getValidProductQuantity()
        print(customer.addProductToCart(productName: productName,
                                        productQuantity: productQuantity))
    }
    
    func removeProductFromCart() {
        guard !customer.getCart().isEmpty else {
            print(Messages.noCartExist)
            return
        }
        customer.getCart().forEach{
            print($0)
        }
        print("Enter product name to remove from cart")
        let productName: String = InputUtil.getValidStringInput()
        print(customer.removeProductFromCart(productName: productName))
        
    }
    
    func viewCart() {
        guard !customer.getCart().isEmpty else {
            print(Messages.noCartExist)
            return
        }
        customer.getCart().forEach{
            print($0)
        }
        while(true) {
            print("Enter \t\t\t1.Go Back\t\t\t\t\t\t2.Place Order")
            let cartChoice: Int = InputUtil.getValidNumberInput(minValue: 1, maxValue: 2)
            if cartChoice == 1 {
                return
            }
            else if cartChoice == 2 {
                print(customer.placeOrder())
                return
            }
            else {
                print("Invalid Input Try Again!")
            }
        }
    }
    
    
}
