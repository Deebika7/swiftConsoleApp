//
//  LoginOptions.swift
//  swiftConsoleApp
//
//  Created by deebika-pt6680 on 29/03/23.
//

enum LoginOptions: String, CaseIterable {
    
    case signIn = "Sign In",
         signUp = "Sign Up",
         quit = "Quit"
    var index: Int { LoginOptions.allCases.firstIndex(of: self) ?? 0 }
    
}
