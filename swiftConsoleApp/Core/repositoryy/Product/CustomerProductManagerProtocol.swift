//
//  CustomerProductManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

protocol CustomerProductManagerProtocol: AnyObject {
    func getAllProduct() -> [Product]
    func getAllDiscount() -> [String: Discount]
    func checkIfProductExist(productName: String) -> Bool
}
