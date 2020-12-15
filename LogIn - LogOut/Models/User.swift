//
//  User.swift
//  LogIn - LogOut
//
//  Created by Владимир Панасенков on 15.12.2020.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "Password",
            person: Person(name: "Vladimir", surname: "Panasenkov")
        )
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
