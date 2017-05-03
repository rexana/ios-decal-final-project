//
//  SleekCardViewController.swift
//  BusinessCardApp
//
//  Created by Rexana Church on 4/30/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import UIKit

class SleekCardViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!

    @IBOutlet weak var backgroundImage: UIImageView!
    
    var nameString: String?
    var titleString: String?
    var phoneString: String?
    var emailString: String?
    var websiteString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.layer.borderColor = UIColor.gray.cgColor
        backgroundImage.layer.borderWidth = 1
        
        nameLabel.text = nameString
        titleLabel.text = titleString
        phoneLabel.text = phoneString
        emailLabel.text = emailString
        websiteLabel.text = websiteString
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
