//
//  UserDetailsManager.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 30/03/23.
//

protocol UserDetailsManagerProtocol: AnyObject {
    func isUserExist(_ phoneNumber: Int) -> Bool
    func addUser(name: String, phoneNumber: Int, password: String, userType: UserType) -> Bool
    func getUser(phoneNumber: Int) -> User?
    func isUserValid(phoneNumber: Int, password: String) -> Bool 
}
