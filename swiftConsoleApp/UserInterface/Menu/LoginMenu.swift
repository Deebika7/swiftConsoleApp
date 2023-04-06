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
        let phoneNumber: Int = InputUtil.getValidIntegerInput()
        print("Enter Password ")
        let password: String = InputUtil.getValidStringInput()
        
        guard !userDataManager.isUserValid(phoneNumber: phoneNumber, password: password) else {
            print(Messages.signInFailed)
            return
        }
        loginUser(user: userDataManager.getUser(phoneNumber: phoneNumber))
        print(Messages.successSignIn)
        let user: User = userDataManager.getUser(phoneNumber: phoneNumber)
        loginUser(user: user)
        
    }
    
    func signUp() {
        
        print("How would you like to signIn?")
        
        for (index, value) in UserType.allCases.enumerated() {
            print("\(index + 1). \(value.rawValue)")
        }
        
        let preference: Int = InputUtil.getValidIntegerInput()
        let preferenceEnum = UserType.allCases[preference - 1]
        var userType: UserType
        switch preferenceEnum {
        case .admin:
            userType = .admin
        case .customer:
            userType = .customer
        }
        
        print("Enter Name ")
        let name: String = InputUtil.getValidStringInput()
        print("Enter Phone Number ")
        let phoneNumber: Int = InputUtil.getValidphoneNumber()
        print("Enter Password ")
        let password: String = InputUtil.getValidPassword()
        print("Enter Confirm Password ")
        guard InputUtil.verifyConfirmPassword(password: password) else {
            return
        }
        guard !userDataManager.isUserExist(phoneNumber) else {
            print(Messages.userAlreadyExist)
            return
        }
        
        guard userDataManager.addUser(name: name, phoneNumber: phoneNumber, password: password, userType: userType) else {
            return
        }
        print("\(Messages.successSignUp)")
        let user: User = userDataManager.getUser(phoneNumber: phoneNumber)
        loginUser(user: user)
        
    }
    
    func  loginUser(user: User) {
        if user as? Admin != nil {
            AdminMenu(admin: (user as? Admin)!).displayAdminMenu()
        }
        else if user as? Customer != nil {
            CustomerMenu(customer: (user as? Customer)!).displayCustomerMenu()
        }
    }
    
}

