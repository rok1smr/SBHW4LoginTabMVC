//
//  UserVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 02.11.2021.
//

import UIKit

class UserVC: UIViewController {
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVCont = segue.destination as? InfoVC else { return }
        infoVCont.user = user
    }

}
