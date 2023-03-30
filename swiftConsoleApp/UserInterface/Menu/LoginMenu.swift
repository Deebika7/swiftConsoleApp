//
//  LoginMenu.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct LoginMenu {
    
    var userDataManager = UserDataManager()
    
    func signIn() {
        
        print("Enter Phone Number ")
        let phoneNumber: Int = Validator.getValidphoneNumber()
        print("Enter Password ")
        let password: String = Validator.getValidStringInput()
        
    }
    
    func signUp() {
        print("How would you like to signIn?")
        print("1. admin\n2. Customer")
        let preference: Int = Validator.getValidSwitchInput(maxValue: 2)
        let userType: String
        if preference == 1 {
            userType = "admin"
        }
        else {
            userType = "customer"
        }
        print("Enter Name ")
        let name: String = Validator.getValidStringInput()
        print("Enter Phone Number ")
        let phoneNumber: Int = Validator.getValidphoneNumber()
        print("Enter Password ")
        let password: String = Validator.getValidPassword()
        print("Enter Confirm Password ")
        Validator.confirmPasswordVerifier(password: password)

        guard !userDataManager.isUserExist(phoneNumber) else {
            print(Messages.UserAlreadyExist)
            return
        }
        
        guard userDataManager.addUser(name: name, phoneNumber: phoneNumber, password: password, userType: userType) else {
            return
        }
        print(userDataManager.getUser(phoneNumber: phoneNumber).description)
        print(Messages.successSignUp)
        
        
    }
    
}

