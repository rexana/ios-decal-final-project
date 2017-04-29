//
//  LoginViewController.swift
//  app
//
//  Created by Rexana Church on 4/28/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Checks if user is already signed in and skips login
        if FIRAuth.auth()?.currentUser != nil {
            self.performSegue(withIdentifier: "loginToMain", sender: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didAttemptLogin(_ sender: UIButton) {
        guard let emailText = emailField.text else { return }
        guard let passwordText = passwordField.text else { return }
        
        FIRAuth.auth()?.signIn(withEmail: emailText, password: passwordText, completion: {(user, error) in
            if error != nil {
                let alertController = UIAlertController(title: "Sign In Failure", message: "Sign in failed, try again", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "loginToMain", sender: nil)
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

