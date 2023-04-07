//
//  AdminProductManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

protocol AdminProductManagerProtocol: AnyObject {
    
    func addProduct(product: Product) -> Bool
    func removeProduct(productName: String) -> String
    func addDiscount(productName: String, discount: Discount) -> String
    func removeDiscount(discountID: Int) -> String
    func checkIfProductExist(productName: String) -> Bool
    
}
