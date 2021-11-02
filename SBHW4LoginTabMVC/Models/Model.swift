//
//  Model.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 30.10.2021.
//

import Foundation
import UIKit


struct User {
    var login: String
    var password: String
    var person: Person
    
    static func getUser() -> User {
        User(login: "Neo",
             password: "123",
             person: Person( name: "Ivan Ivanov",
                             description: "Is the most common name in Russia",
                             bigDescription: "Ivan is the most advanced iOS Developer in Russia 🔥",
                             pictureOfUser: "IvanPhoto"))
//        User(login: "Smith",
//             password: "000",
//             person: Person(name: "John Doe",
//                            description: "Is the most common name in USA",
//                            bigDescription: "John is very strict and angry and is always looking for Ivan from Russia 😎",
//                            pictureOfUser: "JohnPhoto"))
        }
    }

struct Person {
    var name: String
    var description: String
    var bigDescription: String
    var pictureOfUser: String
    
    var fullName: String { "\(name)" }
}
