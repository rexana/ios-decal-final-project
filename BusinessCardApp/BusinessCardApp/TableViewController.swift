//
//  TableViewController.swift
//  BusinessCardApp
//
//  Created by Rexana Church on 4/30/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var nameString: String?
    var titleString: String?
    var phoneString: String?
    var emailString: String?
    var websiteString: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func classicStyleChosen(_ sender: UIButton) {
        performSegue(withIdentifier: "ToClassic", sender: self)
    }

    @IBAction func sleekStyleChosen(_ sender: UIButton) {
        performSegue(withIdentifier: "ToSleek", sender: self)
    }

    @IBAction func ColorfulStyleChosen(_ sender: UIButton) {
        performSegue(withIdentifier: "ToColorful", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let classicCardViewController = segue.destination as? ClassicCardViewController {
            classicCardViewController.nameString = nameString
            classicCardViewController.titleString = titleString
            classicCardViewController.phoneString = phoneString
            classicCardViewController.emailString = emailString
            classicCardViewController.websiteString = websiteString
        }
        
        if let sleekCardViewController = segue.destination as? SleekCardViewController {
            sleekCardViewController.nameString = nameString
            sleekCardViewController.titleString = titleString
            sleekCardViewController.phoneString = phoneString
            sleekCardViewController.emailString = emailString
            sleekCardViewController.websiteString = websiteString
        }
        
        if let colorfulCardViewController = segue.destination as? ColorfulCardViewController {
            colorfulCardViewController.nameString = nameString
            colorfulCardViewController.titleString = titleString
            colorfulCardViewController.phoneString = phoneString
            colorfulCardViewController.emailString = emailString
            colorfulCardViewController.websiteString = websiteString
        }
        
    }
}
