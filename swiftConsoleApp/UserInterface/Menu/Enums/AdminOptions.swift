//
//  AdminOptions.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

enum AdminOptions: String, CaseIterable {
    
    case listOrders = "List Orders",
         viewProduct = "View Product",
         viewDiscounts = "View Discounts",
         addProduct = "Add Product",
         addDiscount = "Add Discount",
         removeProduct = "Remove Product",
         removeDiscount = "Remove Discount",
         quit = "Quit"
    var index: Int { AdminOptions.allCases.firstIndex(of: self) ?? 0 }
    
}


