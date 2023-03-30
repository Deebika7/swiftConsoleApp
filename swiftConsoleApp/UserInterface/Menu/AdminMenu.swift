//
//  AdminMenu.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct AdminMenu {
    
    func adminMenu() {
        AdminMenuLoop: while(true) {
            print("------------------------------------------------------------------------------------------")

            for options in AdminOptions.allCases.enumerated() {
                print("\(options.element.rawValue). \(options.element)")
            }
            
            print("------------------------------------------------------------------------------------------")
            
            print("Enter your preference [1 to \(AdminOptions.allCases.count)] ")
            
            let preference: Int = Validator.getValidSwitchInput(maxValue: AdminOptions.allCases.count)
            //let preferenceInEnum =

            switch preference {
            case 1:
                addProduct()
            case 2:
                removeProduct()
            case 3:
                viewProducts()
            case 4:
                addDiscount()
            case 5:
                removeDiscount()
            case 6:
                viewDiscount()
            case 7:
                listOrders()
            case 8:
                break AdminMenuLoop
            default:
                print("invalid input")
            }
        }
    }
    
    func addProduct() {
        
    }
    
    func removeProduct() {
        
    }
    
    func viewProducts() {
        
    }
    
    func addDiscount() {
        
    }
    
    func removeDiscount() {
        
    }
    
    func viewDiscount() {
        
    }
    
    func listOrders() {
        
    }
    
}

