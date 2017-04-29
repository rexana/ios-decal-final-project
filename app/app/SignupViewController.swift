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

class SignupViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        // Make image field rounded
        imageField.layer.borderWidth = 1
        imageField.layer.masksToBounds = false
        imageField.layer.borderColor = UIColor.white.cgColor
        imageField.layer.cornerRadius = imageField.frame.height/2
        imageField.clipsToBounds = true
        imageField.image = #imageLiteral(resourceName: "NoProfilePic")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectPicture(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        
        self.present(picker, animated: true, completion: nil)
    }
        
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            imageField.contentMode = .scaleAspectFit
//            imageField.image = chosenImage
//            imageField.isHidden = false
//        } else{
//            print("Something went wrong")
//        }
////        dismiss(animated:true, completion: nil)
//    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imageField.contentMode = .scaleAspectFit
        imageField.image = image
        imageField.isHidden = false
        dismiss(animated:true, completion: nil)
        var data = NSData()
        data = UIImageJPEGRepresentation(imageField.image!, 0.8)! as NSData
        // set upload path
        let filePath = "\(FIRAuth.auth()!.currentUser!.uid)/\("profilePic")"
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpg"
        let storageRef = FIRStorage.storage().reference()
        let dbRef = FIRDatabase.database().reference()
        storageRef.child(filePath).put(data as Data, metadata: metaData){(metaData,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                //store downloadURL
                let downloadURL = metaData!.downloadURL()!.absoluteString
                //store downloadURL at database
            dbRef.child("users").child(FIRAuth.auth()!.currentUser!.uid).updateChildValues(["profilePic": downloadURL])
            }
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    /* TODO: Upload the image to Firebase also */
    @IBAction func didAttemptSignup(_ sender: UIButton) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let name = nameField.text else { return }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user, error) in
            if let error = error {
                let alertController = UIAlertController(title: "Sign Up Failure", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let changeRequest = user!.profileChangeRequest()
                changeRequest.displayName = name
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
    
//    // Store the data for a new post in the Firebase database.
//    func addPost(postImage: UIImage, thread: String, username: String) {
//        let dbRef = FIRDatabase.database().reference()
//        let data = UIImageJPEGRepresentation(postImage, 1.0)!
//        let path = "\(firStorageImagesPath)/\(UUID().uuidString)"
//        
//        let postNodeDict = [firImagePathNode : path, firThreadNode : thread, firUsernameNode : username, firDateNode : date]
//        dbRef.child(firPostsNode).childByAutoId().setValue(postNodeDict)
//        
//        store(data: data, toPath: path)
//        
//    }
    
    // Store the data to the given path on the storage module using the put function.
    func store(data: Data, toPath path: String) {
        let storageRef = FIRStorage.storage().reference()
        
        storageRef.child(path).put(data, metadata: nil) { (metadata, error) in
            if let error = error {
                print(error)
            }
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

