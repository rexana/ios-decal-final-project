//
//  ClassicCardViewController.swift
//  BusinessCardApp
//
//  Created by Rexana Church on 4/30/17.
//  Copyright © 2017 Rexana Church. All rights reserved.
//

import UIKit

class ClassicCardViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var phoneLabel: UILabel!
//    @IBOutlet weak var emailLabel: UILabel!
//    @IBOutlet weak var websiteLabel: UILabel!
    
    var nameString: String?
    var titleString: String?
    var phoneString: String?
    var emailString: String?
    var websiteString: String?
    
    var activityViewController: UIActivityViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

//        nameLabel.text = nameString
//        titleLabel.text = titleString
//        phoneLabel.text = phoneString
//        emailLabel.text = emailString
//        websiteLabel.text = websiteString
        
        var image = textToImage(drawText: nameString! as NSString, textFont: UIFont(name: "Hoefler Text", size: 17)!, inImage: #imageLiteral(resourceName: "classic_bkgd"), atPoint: CGPoint(x: 0, y: (backgroundImage.image?.size.height)!/6))
        
        image = textToImage(drawText: titleString! as NSString, textFont: UIFont(name: "Hoefler Text", size: 12)!, inImage: image, atPoint: CGPoint(x: 0, y: (backgroundImage.image?.size.height)!/6 + 25))

        image = textToImage(drawText: phoneString! as NSString, textFont: UIFont(name: "Hoefler Text", size: 12)!, inImage: image, atPoint: CGPoint(x: 0, y: (backgroundImage.image?.size.height)!/6 + 40))

        image = textToImage(drawText: emailString! as NSString, textFont: UIFont(name: "Hoefler Text", size: 12)!, inImage: image, atPoint: CGPoint(x: 0, y: (backgroundImage.image?.size.height)!/6 + 55))

        image = textToImage(drawText: websiteString! as NSString, textFont: UIFont(name: "Hoefler Text", size: 12)!, inImage: image, atPoint: CGPoint(x: 0, y: (backgroundImage.image?.size.height)!/6 + 70))
        backgroundImage.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textToImage(drawText text: NSString, textFont font: UIFont, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        
        // Setup the font specific variables
        let textColor = UIColor.black
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        // Setup the image context using the passed image
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        // Setup the font attributes that will be later used to dictate how the text should be drawn
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: textColor,
            NSParagraphStyleAttributeName: paragraphStyle]

        // Put the image into a rectangle as large as the original image
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        // Create a point within the space that is as big as the image
        let rect = CGRect(origin: point, size: image.size)
        
        // Draw the text into an image
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        // Create a new image out of the images we have created
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // End the context now that we have the image we need
        UIGraphicsEndImageContext()
        
        //Pass the image back up to the caller
        return newImage!
        
    }

    @IBAction func saveButtonWasPressed(_ sender: UIButton) {
        let activityViewController = UIActivityViewController(
            activityItems: [backgroundImage.image!],
            applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)

    }
}
