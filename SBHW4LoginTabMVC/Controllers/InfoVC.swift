//
//  InfoVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 31.10.2021.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = UserStore.shared.currentUser?.name
        
// если логин и пароль введены от существующего юзера - отображаем здесь его имя
        if let currentUser = UserStore.shared.currentUser {
            descriptionLabel.text = currentUser.description
        }
    }
}
