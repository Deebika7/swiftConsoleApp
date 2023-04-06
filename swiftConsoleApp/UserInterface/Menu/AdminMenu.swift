//
//  AdminMenu.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct AdminMenu {
    var admin: Admin
    init(admin: Admin) {
        self.admin = admin
    }
    func displayAdminMenu() {
        var adminMenuLoop = true
        while(adminMenuLoop) {
            print("------------------------------------------------------------------------------------------")

            for (index, value) in AdminOptions.allCases.enumerated() {
                print("\(index + 1). \(value.rawValue)")
            }
            
            print("------------------------------------------------------------------------------------------")
            
            print("Enter your preference [1 to \(AdminOptions.allCases.count)] ")
            
            let preference: Int = InputUtil.getValidNumberInput(minValue: 1,maxValue: AdminOptions.allCases.count)
            
            let preferenceEnum = AdminOptions.allCases[preference - 1]
            
            switch preferenceEnum {
            case .listOrders:
                listOrders()
            case .viewProduct:
                viewProducts()
            case .viewDiscounts:
                viewDiscount()
            case .addProduct:
                addProduct()
            case .addDiscount:
                addDiscount()
            case .removeProduct:
                removeProduct()
            case .removeDiscount:
                removeDiscount()
            case .quit:
                adminMenuLoop = false
            default:
                print("invalid input")
            }
        }
        
    }
    
    func printProductCategory(){
        for (index, value) in ProductCategory.allCases.enumerated() {
            print("\(index + 1). \(value.rawValue)")
        }
    }
    
    func addProduct() {
        
        print("Select category to add product ")
        printProductCategory()
        print("select category from [1 to \(ProductCategory.allCases.count)] ")
        let productCategory: Int = InputUtil.getValidNumberInput(minValue: 1, maxValue: ProductCategory.allCases.count)
        let productCategoryEnum: ProductCategory = ProductCategory.allCases[productCategory - 1]
        print("Enter Product Name ")
        let productName: String = InputUtil.getValidStringInput()
        print("Enter Product Quantity ")
        let productQuantity: Int = InputUtil.getValidProductQuantity()
        print("Enter Unit Price ")
        let unitPrice: Double = InputUtil.getValidPrice()
        print(admin.addProduct(productName: productName, productCategory: productCategoryEnum, unitPrice: unitPrice, productQuantity: productQuantity))
        
    }
    
    func removeProduct() {
        print("Enter product name to remove ")
        let productName: String = InputUtil.getValidStringInput()
        print(admin.removeProduct(productName: productName))
    }
    
    func viewProducts() {
        
    }
    
    func addDiscount() {
        print("Enter product name to add discount ")
        let productName: String = InputUtil.getValidStringInput()
        print("Enter discount percentage ")
        let discountPercentage: Double = InputUtil.getValidDiscountPercentage()
        print(admin.addDiscount(productName: productName, discountPercentage: discountPercentage))
    }
    
    func removeDiscount() {
        
    }
    
    func viewDiscount() {
        
    }
    
    func listOrders() {
        
    }
    
}

