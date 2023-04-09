//
//  UserDataManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

struct UserDataManager {
    
    init(){
        databaseManager.addUserToUserDB(phoneNumber: 9876543210, user: Admin(name: "test", phoneNumber: 9876543210, adminOrderManager: OrderDataManager(), adminProductManager: ProductDataManager()))
        databaseManager.addPhoneNumberAndPasswordToDB(phoneNumber: 9876543210, password: "test1234")
    }
    
    var databaseManager = DatabaseManager.DBManagerInstance
    
    func isUserExist(_ phoneNumber: Int) -> Bool {
        return databaseManager.isUserExistInDB(phoneNumber: phoneNumber)
    }
    
    func addUser(name: String, phoneNumber: Int, password: String, userType: UserType) -> Bool {
        databaseManager.addPhoneNumberAndPasswordToDB(phoneNumber: phoneNumber, password: password)
        if(userType == .admin) {
            databaseManager.addUserToUserDB(phoneNumber: phoneNumber, user: Admin(name: name, phoneNumber: phoneNumber, adminOrderManager: OrderDataManager(), adminProductManager: ProductDataManager()))
        }
        else {
            databaseManager.addUserToUserDB(phoneNumber: phoneNumber, user: Customer(name: name, phoneNumber: phoneNumber, customerOrderManager: OrderDataManager(), customerProductManager: ProductDataManager()))
        }
        return true
    }
    
    func getUser(phoneNumber: Int) -> User? {
        if  databaseManager.getUserFromDB(phoneNumber: phoneNumber) != nil {
            return databaseManager.getUserFromDB(phoneNumber: phoneNumber)
        }
        return nil
    }
    
    func isUserValid(phoneNumber: Int, password: String) -> Bool {
        let storedPassword: String = databaseManager.getUserPasswordFromDB(phoneNumber: phoneNumber) ?? ""
        if password == storedPassword {
            return true
        }
        return false
    }
    
}
