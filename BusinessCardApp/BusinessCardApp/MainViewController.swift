//
//  MainViewController.swift
//  BusinessCardApp
//
//  Created by Rexana Church on 4/30/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var websiteField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createButtonWasPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "MainToTable", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationViewController = segue.destination as? UINavigationController
        let tableViewController = navigationViewController?.viewControllers.first as! TableViewController
        tableViewController.nameString = nameField.text!
        tableViewController.titleString = titleField.text!
        tableViewController.phoneString = phoneField.text!
        tableViewController.emailString = emailField.text!
        tableViewController.websiteString = websiteField.text!
        
//        let tableViewController = storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
//        tableViewController.nameString = nameField.text!
//        tableViewController.titleString = titleField.text!
//        tableViewController.phoneString = phoneField.text!
//        tableViewController.emailString = emailField.text!
//        tableViewController.websiteString = websiteField.text!
    }

}

