//
//  DatabaseManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

class DatabaseManager {
    private let DBInstance = MainDatabase()
    private init() {}
    private let DBManagerInstance = DatabaseManager()
    static func getDBManagerInstance<T:DatabaseManager>() -> T {
        return DBManagerInstance
    }
    
    
}

