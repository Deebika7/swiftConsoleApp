//
//  CustomerOptions.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

enum CustomerOptions: Int, CaseIterable {
    case view_products = 1,
         check_discount = 2,
         add_product_to_cart = 3,
         remove_product_from_cart = 4,
         view_cart = 5,
         quit = 6
}
