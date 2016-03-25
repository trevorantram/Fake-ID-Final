//
//  view2.swift
//  Fake ID Final
//
//  Created by Trevor Antram on 3/15/16.
//  Copyright © 2016 Trevor Antram. All rights reserved.
//

import WatchKit



class view2: WKInterfaceController {
    @IBOutlet var filterValueLabel: WKInterfaceLabel!
    
    
 
    
    
    
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        if let val: String = context as? String {
            self.filterValueLabel.setText(val)
        } else {
            self.filterValueLabel.setText("")
        }
      
        
        
        // Configure interface objects here.
    }
    
}
