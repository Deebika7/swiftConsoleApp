//
//  AdminOrderManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

protocol AdminOrderManagerProtocol: AnyObject {
    func getAllOrders() -> [Int: Order] 
}
