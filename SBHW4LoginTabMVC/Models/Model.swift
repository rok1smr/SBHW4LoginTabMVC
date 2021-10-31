//
//  Model.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 30.10.2021.
//

import Foundation


struct User {
    var login: String
    var password: String
    var name: String
    var description: String
}

class UserStore {
    
//  паблик статик вар нужен для того что бы к классу UserStore обращаться из других файлов
    public static var shared = UserStore()
    
//  создаем несколько вариантов юзеров
    private var users: [User] = [
        User(login: "U", password: "123", name: "Ivan Ivanov", description: "Is the most common name in Russia"),
        User(login: "O", password: "000", name: "John Doe", description: "Is the most common name in USA")
    ]
    
//  паблик вар создаем для того что бы можно было в других файлах обращаться к методу currentUser
    public var currentUser: User?
    
//  функция логин нужна для того что бы проверить чьи идентификаторы мы ввели и на основе этого вернуть того юзера который нужен
    func login(with login: String, password: String) -> User? {
        // CHECK user and setup currentUser
        let filteredUsers = users.filter { $0.login == login && $0.password == password }
        self.currentUser = filteredUsers.first
        
        return currentUser
    }
}


