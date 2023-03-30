//
//  LoginMenu.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

struct LoginMenu {
    
    func signIn() {
        print("Enter Phone Number ")
        let phoneNumber: Int = Validator.getValidphoneNumber()
        print("Enter Password ")
        let password: String = readLine()!
    }
    
    func signUp() {
        print("Enter Name ")
        let name: String = Util.getValidStringInput()
        print("Enter Phone Number ")
        let phoneNumber: Int = Validator.getValidphoneNumber()
        print("Enter Password ")
        let password: String = Validator.getValidPassword()
        print("Enter Confirm Password ")
        Validator.confirmPasswordVerifier(password: password)
    }
}

