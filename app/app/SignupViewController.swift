//
//  SignupViewController.swift
//  app
//
//  Created by Rexana Church on 4/28/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        phoneNumberField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didAttemptSignup(_ sender: UIButton) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let name = nameField.text else { return }
        guard let phoneNumber = phoneNumberField.text else { return }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user, error) in
            if let error = error {
                let alertController = UIAlertController(title: "Sign Up Failure", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let changeRequest = user!.profileChangeRequest()
                changeRequest.displayName = name
                changeRequest.phoneNumber = phoneNumber
                changeRequest.commitChanges(completion:
                    {(err) in
                        if let err = err {
                            print(err)
                        } else {
                            self.performSegue(withIdentifier: "signupToMain", sender: nil)
                        }
                })
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

