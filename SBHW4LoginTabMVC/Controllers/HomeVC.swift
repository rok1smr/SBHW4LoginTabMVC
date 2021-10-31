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
            textLabel.text = currentUser.name
        }
    }
    
//  при нажатии кнопки логаут выполяется анвинд сигвэй
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
            performSegue(withIdentifier: "toLogin", sender: self)
        }

}
