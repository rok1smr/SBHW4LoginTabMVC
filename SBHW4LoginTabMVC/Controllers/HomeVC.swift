//
//  HomeVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 30.10.2021.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

// если логи и пароль введены от существующего юзера - отображаем здесь его имя
        if let currentUser = UserStore.shared.currentUser {
            textLabel.text = "You logged in as: \(currentUser.name), click on the user icon in the tab bar to find out more about him 😏"
        }
    }
    
//  при нажатии кнопки логаут выполяется анвинд сигвэй
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
            performSegue(withIdentifier: "toLogin", sender: self)
        }

}
