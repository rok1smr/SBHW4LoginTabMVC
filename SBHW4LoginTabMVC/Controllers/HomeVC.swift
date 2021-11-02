//
//  HomeVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 30.10.2021.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    var user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "You logged in as: \(user.person.name), click on the user icon in the tab bar to find out more about him 😏"
    }
    
//  при нажатии кнопки логаут выполяется анвинд сигвэй
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
            performSegue(withIdentifier: "toLogin", sender: self)
        }

}
