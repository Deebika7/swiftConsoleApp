//
//  ProductDB.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//

struct MainDatabase {
    var productDb: [String: Product] = [:]
    var discountDb: [String: Discount] = [:]
    var orderDb: [Int: Order] = [:]
    var userDb: [Int: User] = [:]
    var cartDb: [Int: [Cart]] = [:]
    var accountDb: [Int: String] = [:]
}


