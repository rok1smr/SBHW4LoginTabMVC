//
//  InfoVC.swift
//  SBHW4LoginTabMVC
//
//  Created by Konstantin on 31.10.2021.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = user.person.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let info2VCont = segue.destination as? Info2VC else { return }
        info2VCont.user = user
    }
}
