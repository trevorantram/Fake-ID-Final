//
//  InterfaceController.swift
//  Fake ID APp Extension
//
//  Created by Trevor Antram on 3/15/16.
//  Copyright © 2016 Trevor Antram. All rights reserved.
//

import WatchKit
import Foundation
import UIKit



var filterAmount = 0
var mainID = false

class InterfaceController: WKInterfaceController {
    @IBOutlet var filterLevel: WKInterfaceLabel!
    @IBOutlet var filterO: WKInterfaceSlider!
    @IBAction func filterA(value: Float) {
         var filterA = round(value)
        print(filterA)
        filterLevel.setText("Filter : \(filterA)")
        
        
        
        
    }
    @IBAction func mainIDButton() {
        print("Tapped")
        mainID = true
        
        
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        filterO.setValue(0)
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    

    
    
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        
        return filterAmount
        
    }

}
