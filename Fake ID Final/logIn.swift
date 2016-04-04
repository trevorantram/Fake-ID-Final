//
//  logIn.swift
//  Fake ID Final
//
//  Created by Trevor Antram on 3/28/16.
//  Copyright © 2016 Trevor Antram. All rights reserved.
//

import UIKit
import Parse
import LocalAuthentication


class logIn: UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    
    
  
    @IBAction func signUp(sender: AnyObject) {
    
    var user = PFUser()
    user.username = usernameText.text
    user.password = passwordText.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
            
            } else {
                // Hooray! Let them use the app now.
                
                print("It worked")
            }
        }
    }
        
    
    
   
    @IBAction func logIn(sender: AnyObject) {
        
    }
    
    
}
