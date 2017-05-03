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
        
        nameField.autocapitalizationType = .words
        titleField.autocapitalizationType = .sentences
        phoneField.keyboardType = .phonePad
        emailField.keyboardType = .emailAddress
        websiteField.keyboardType = .URL
        
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    // Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}

