//
//  Info2VC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 31.10.2021.
//

import UIKit

class Info2VC: UIViewController {

    @IBOutlet weak var photoOfUser: UIImageView!
    @IBOutlet weak var bigDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = UserStore.shared.currentUser?.name
        
        if let currentUser = UserStore.shared.currentUser {
            bigDescription.text = currentUser.bigDescription;
            photoOfUser.image = currentUser.pictureOfUser
        }
    }
    
}
