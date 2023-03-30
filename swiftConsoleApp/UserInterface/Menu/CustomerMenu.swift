//
//  CustomerMenu.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct CustomerMenu {
    
    func customerMenu() {
        CustomerMenuLoop: while(true) {
            print("------------------------------------------------------------------------------------------")

            for options in CustomerOptions.allCases.enumerated() {
                print("\(options.element.rawValue). \(options.element)")
            }
            
            print("------------------------------------------------------------------------------------------")
            
            print("Enter your preference [1 to \(CustomerOptions.allCases.count)] ")
            
            let preference: Int = Validator.getValidSwitchInput(maxValue: CustomerOptions.allCases.count)
            
            switch preference {
            case 1:
                viewProducts()
            case 2:
                viewDiscount()
            case 3:
                addProductToCart()
            case 4:
                removeProductFromCart()
            case 5:
                viewCart()
            case 6:
                break CustomerMenuLoop
            default:
                print("invalid input")
            }
        }
    }

    func viewProducts() {
        
    }
    
    func viewDiscount() {
        
    }
    
    func addProductToCart() {
        
    }
    
    func removeProductFromCart() {
        
    }
    
    func viewCart() {
        
    }
    
    
}
