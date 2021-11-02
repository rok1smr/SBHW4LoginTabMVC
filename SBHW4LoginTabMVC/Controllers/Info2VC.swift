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
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.name
        
        bigDescription.text = user.person.bigDescription
        photoOfUser.image = UIImage(named: "\(user.person.pictureOfUser)")
        
    }
    
}
