//
//  UserDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

struct UserDataManager {
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
    func isUserExist(_ phoneNumber: Int) -> Bool {
        return databaseManager.isUserExistInDB(phoneNumber: phoneNumber)
    }
    
    func addUser(name: String, phoneNumber: Int, password: String, userType: String) -> Bool {
        databaseManager.addPhoneNumberAndPasswordToDB(phoneNumber: phoneNumber, password: password)
        if(userType == "admin") {
            databaseManager.addUserToUserDB(phoneNumber: phoneNumber, user: Admin(name: name, phoneNumber: phoneNumber))
        }
        else {
            databaseManager.addUserToUserDB(phoneNumber: phoneNumber, user: Customer(name: name, phoneNumber: phoneNumber))
        }
        return true
    }
    
    func getUser(phoneNumber: Int) -> User {
      return  databaseManager.getUserFromDB(phoneNumber: phoneNumber)!
    }
    
    func isUserValid(phoneNumber: Int, password: String) -> Bool {
        let storedPassword: String = databaseManager.getUserPasswordFromDB(phoneNumber: phoneNumber)!
        if password == storedPassword {
            return true
        }
        return false
    }
    
    
    
}
