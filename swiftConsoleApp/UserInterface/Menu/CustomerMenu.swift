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
            case .addProductToCart:
                addProductToCart()
            case .removeProductFromCart:
                removeProductFromCart()
            case .viewCart:
                viewCart()
            case .quit:
                break 
            default:
                print("invalid input")
            }
        }
        
    }

    func viewProducts() {
        guard !customer.getProducts().isEmpty else {
            print(Messages.noProductExist)
            return
        }
        print("Select category to view products")
        printProductCategory()
        let productPreference: Int = InputUtil.getValidNumberInput(minValue: 1, maxValue: ProductCategory.allCases.count)
        let productPreferenceEnum: ProductCategory = ProductCategory.allCases[productPreference - 1]
        let products: [Product] = customer.getProducts()
        print("==========================\t\(productPreferenceEnum)\t===============================================")
        print("=====================================================================================");
        print("Product ID\t|\tProduct Name\t|\tunit price\t|\tAvailable quantity");
        print("=====================================================================================");
        products.filter { $0.productCategory == productPreferenceEnum }.forEach{print("\($0.productID)\t\t\t\($0.productName)\t\t\t\t\t\($0.productPrice)\t\t\t\t\($0.productQuantity)")}
    }
    
    func viewDiscount() {
        guard !customer.getDiscounts().isEmpty else {
            print(Messages.noDiscountExist)
            return
        }
        let discounts: [String:Discount] = customer.getDiscounts()
        discounts.forEach{ discount in
            print("=========================================================")
            print("Discount ID\t|\tProduct Name\t|\tDiscount Percentage")
            print("=========================================================")
            print("\(discount.value.discountID)\t\t\t\(discount.key)\t\t\t\t\t\(discount.value.discountPercentage)")
            print("=========================================================")
        }
    }
    
    func addProductToCart() {
        print("Enter product name: ")
    }
    
    func removeProductFromCart() {
        
    }
    
    func viewCart() {
        
    }
    
    
}
