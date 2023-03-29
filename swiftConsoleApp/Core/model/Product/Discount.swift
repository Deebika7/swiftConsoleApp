//
//  Discount.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 28/03/23.
//
struct Discount {
    
    private let ID: Int
    private var percentage: Double
    
    public var discountID: Int {
        get {
            return self.ID
        }
    }
    
    public var discountPercentage: Double {
        get {
            return self.percentage
        }
    }
    
    init(ID: Int, percentage: Double) {
        self.ID = ID
        self.percentage = percentage
    }
}


