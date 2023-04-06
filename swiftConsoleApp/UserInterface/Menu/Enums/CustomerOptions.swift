//
//  CustomerOptions.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

enum CustomerOptions: String, CaseIterable {
    
    case viewProducts = "View Products",
         checkDiscount = "Check Discount",
         addProductToCart = "Add Product To Cart",
         removeProductFromCart = "Remove Product From Cart",
         viewCart = "View Cart",
         quit = "Quit"
    var index: Int { CustomerOptions.allCases.firstIndex(of: self) ?? 0 }

}
