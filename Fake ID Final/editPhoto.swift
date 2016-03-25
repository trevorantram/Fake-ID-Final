//
//  editPhoto.swift
//  Fake ID Final
//
//  Created by Trevor Antram on 3/15/16.
//  Copyright © 2016 Trevor Antram. All rights reserved.
//

import UIKit

class editPhoto: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
    var imagePicker = UIImagePickerController()
    var filterArray = ["CIColorPolynomial","CIExposureAdjust","CIVibrance","CIColorControls"]
    
    
    @IBOutlet weak var filterSlider: UISlider!
    
    @IBOutlet weak var editImageView: UIImageView!
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    @IBOutlet weak var filterNameLabel: UILabel!
    
    @IBAction func takeAPicture(sender: AnyObject) {
        
        
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
        
        
        
    }
    
   
    
    @IBAction func filterUpdate(sender: AnyObject) {
        
        
        
        var currentImage: UIImage!
        var context: CIContext!
        var currentFilter: CIFilter!
        
        let beginImage = CIImage(image: currentImage)
        let currentValue = filterArray[Int(filterSlider.value)]
        filterNameLabel.text = "\(currentValue)"
        
        
        func applyProcessing(){
            currentFilter.setValue(filterSlider.value, forKey: kCIInputIntensityKey)
            let cgimg = context.createCGImage(currentFilter.outputImage!, fromRect: (currentFilter.outputImage?.extent)!)
            let processesedImage = UIImage(CGImage: cgimg)
            editImageView.image = processesedImage
            
        }
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            imagePicker.dismissViewControllerAnimated(true, completion: nil)
        info[UIImagePickerControllerOriginalImage] as? UIImage

         context = CIContext(options: nil)
         currentFilter = CIFilter(name: currentValue)
         currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
         applyProcessing()
        
        
        
       
        
        }
        
      
        

        
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterSlider.maximumValue = Float(filterArray.count + 1)
        
      
       
        
        
        
        
        filterSlider.minimumValue = 0
        filterSlider.maximumValue = Float(filterArray.count)
        
        filterSlider.continuous = true
        
    }
    
   

}
