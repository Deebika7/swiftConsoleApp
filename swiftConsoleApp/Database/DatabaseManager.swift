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
    
    //user functions
    func addPhoneNumberAndPassword(phoneNumber: Int, password: String){
        DBInstance.accountDb[phoneNumber]=password
    }
    
    func isUserExist(phoneNumber: Int) -> Bool {
        return DBInstance.accountDb.keys.contains(phoneNumber)
    }
    
    func getUserPassword(phoneNumber: Int) -> String? {
        guard let password = DBInstance.accountDb[phoneNumber] else{
                    return nil
        }
        return password
    }
    //product functions
    
    //order functions
    
    //cart functions
}

