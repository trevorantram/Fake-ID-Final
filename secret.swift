//
//  secret.swift
//  Fake ID Final
//
//  Created by Trevor Antram on 3/27/16.
//  Copyright © 2016 Trevor Antram. All rights reserved.
//

import UIKit

class secret: UIViewController {
    
    
    @IBAction func Back(sender: AnyObject) {
        performSegueWithIdentifier("fromHideout", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    
    
}
