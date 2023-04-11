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
        var adminMenuLoop: Bool = true
        while(adminMenuLoop) {
            print("Admin Menu")
            print("------------------------------------------------------------------------------------------")
            
            for (index, value) in AdminOptions.allCases.enumerated() {
                print("\(index + 1). \(value.rawValue)")
            }
            
            print("------------------------------------------------------------------------------------------")
            
            print("Enter your preference [1 to \(AdminOptions.allCases.count)] ")
            
            let preference: Int = InputUtil.getValidNumberInput(minValue: 1,maxValue: AdminOptions.allCases.count)
            
            let preferenceEnum: AdminOptions = AdminOptions.allCases[preference - 1]
            
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
        if admin.addProduct(productName: productName, productCategory: productCategoryEnum, unitPrice: unitPrice, productQuantity: productQuantity) {
            print(Messages.productAdded)
        }
        else {
            print(Messages.productAlreadyExist)
        }
    }
    
    func removeProduct() {
        print("Enter product name to remove ")
        let productName: String = InputUtil.getValidStringInput()
        print(admin.removeProduct(productName: productName))
    }
    
    func viewProducts() {
        guard !admin.getProducts().isEmpty else {
            print(Messages.noProductExist)
            return
        }
        var moreProducts: String = "y"
        while(moreProducts == "y" || moreProducts == "Y") {
            print("Select category to view products")
            printProductCategory()
            let productPreference: Int = InputUtil.getValidNumberInput(minValue: 1, maxValue: ProductCategory.allCases.count)
            let productPreferenceEnum: ProductCategory = ProductCategory.allCases[productPreference - 1]
            let products: [Product] = admin.getProducts()
            print("==========================\t\(productPreferenceEnum)\t================================================")
            print("=====================================================================================");
            print("Product ID\t|\tProduct Name\t|\tunit price\t|\tAvailable quantity");
            print("=====================================================================================");
            products.filter { $0.productCategory == productPreferenceEnum }.forEach{print("\($0.productID)\t\t\t\($0.productName)\t\t\t\t\t\($0.productPrice)\t\t\t\t\($0.productQuantity)")}
            print("=====================================================================================");
            print("Would you like to view more products? [Y] or type anything to exit")
            moreProducts = InputUtil.getValidStringInput()
        }
    }
    
    func addDiscount() {
        print("Enter product name to add discount ")
        let productName: String = InputUtil.getValidStringInput()
        guard admin.checkIfProductExist(productName: productName) else {
            print(Messages.noProductExist)
            return
        }
        print("Enter discount percentage ")
        let discountPercentage: Double = InputUtil.getValidDiscountPercentage()
        print(admin.addDiscount(productName: productName, discountPercentage: discountPercentage))
    }
    
    func removeDiscount() {
        print("Enter product to remove discount")
        let productName: String = InputUtil.getValidStringInput()
        print(admin.removeDiscount(productName: productName))
    }
    
    func viewDiscount() {
        guard !admin.getDiscounts().isEmpty else {
            print(Messages.noDiscountExist)
            return
        }
        let discounts: [String:Discount] = admin.getDiscounts()
        discounts.forEach{ discount in
            print("=========================================================")
            print("Discount ID\t|\tProduct Name\t|\tDiscount Percentage")
            print("=========================================================")
            print("\(discount.value.discountID)\t\t\t\(discount.key)\t\t\t\t\t\(discount.value.discountPercentage)")
            print("=========================================================")
        }
    }
    
    func listOrders() {
        var orders: [String] = admin.listOrders()
        orders.forEach{
            print($0)
        }
    }
    
}

