//
//  InfoVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 31.10.2021.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = user.person.description
        
    }
}
