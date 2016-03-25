	//
//  ViewController.swift
//  Fake ID
//
//  Created by Trevor Antram on 3/8/16.
//  Copyright © 2016 Trevor Antram. All rights reserved.
//

import UIKit
import iAd



// Apple People It was intentional to do this all on one view controller I just wanted to try it
var interAd = ADInterstitialAd()
var interAdView: UIView = UIView()
var gender = "Male"
var name = "Custom Name"
var image = "Random Image"
var theboyName = "nil"
var thegirlName = "nil"
var maleNames = ["John Seagul","Sam Luciahno","Mason Williams","James Smith","Sean McCarthy","Jeb Williams",""]
var femaleNames = ["Emilia Parkerson","Marcillia Lee","Anna Miller","Cameron Martin","Ava Jones"]
var birthdays = ["6/25/1990","3/15/1993","1/13/2000","7/24/87","3,21/1994","1/8/1978"]
var timer = 0
var timerStop = false
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,ADInterstitialAdDelegate,ADBannerViewDelegate {
    let picker = UIImagePickerController()
    var closeButton = UIButton(type:UIButtonType.System) as UIButton
    @IBOutlet weak var main: UILabel!
    @IBOutlet weak var flagO: UIImageView!
    @IBOutlet weak var maleO: UILabel!
    @IBOutlet weak var femaleO: UILabel!
    @IBOutlet weak var CNO: UILabel!
    @IBOutlet weak var disclaimer: UILabel!
    @IBOutlet weak var RNO: UILabel!
    @IBOutlet weak var FIO: UILabel!
    @IBOutlet weak var RIO: UILabel!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var enterD: UILabel!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var nameSwitch: UISwitch!
    @IBOutlet weak var USALogo: UIImageView!
    @IBOutlet weak var imageSwitch: UISwitch!
    @IBOutlet weak var generateO: UIButton!
    @IBOutlet weak var customName: UITextField!
    @IBOutlet weak var Gen2O: UIButton!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var fakeName: UILabel!
    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var fingerprint: UIImageView!
    @IBOutlet weak var IDTitle: UILabel!
    @IBOutlet weak var resetButtonO: UIButton!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBAction func resetButtonA(sender: AnyObject) {
        // this resets the view
        timerStop = true
      resetButtonO.hidden = true
      flagO.hidden = true
      genderSwitch.hidden = false
      theImage.hidden = true
      nameSwitch.hidden = false
      imageSwitch.hidden = false
      USALogo.hidden = true
      RNO.hidden = false
      FIO.hidden = false
      CNO.hidden = false
      RIO.hidden = false
      maleO.hidden = false
      femaleO.hidden = false
      fingerprint.hidden = true
      USALogo.hidden = true
      nameField.hidden = true
      IDTitle.hidden =  true
      birthdayLabel.hidden = true
      serialNumberLabel.hidden = true
      disclaimer.hidden = true
      main.hidden = false
      generateO.hidden = false
      nameSwitch.setOn(true, animated: false)
      genderSwitch.setOn(true, animated: false)
      imageSwitch.setOn(true, animated: false)
        
        

        
      
      
      
        
        
        
        
        
    }
    
    
    var imagePicker: UIImagePickerController!
    @IBAction func gen2A(sender: AnyObject) {
        customName.hidden = true
    // Unhiding all the stuff
       timerStop = false
    var customNameInput = customName.text
        loadAd()
        if timerStop == true{
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerWentOff", userInfo: nil, repeats: true)
        }
    serialNumberLabel.text = "7365 7379 8376 8375"
        
        if name == "Custom Name"{
         
            nameField.text = "\(customNameInput!)"
            
            
        }
        
        theImage.layer.cornerRadius = 8.0
        theImage.clipsToBounds = true
        Gen2O.hidden = true
        enterD.hidden = true
        fakeName!.hidden = true
        theImage.hidden = false
        main.hidden = true
        IDTitle.hidden = false
        nameField.hidden = false
        fingerprint.hidden = false
        birthdayLabel.hidden = false
        serialNumberLabel.hidden = false
        USALogo.hidden = false
        flagO.hidden = false
        disclaimer.hidden = false
        resetButtonO.hidden =  false
       
        
        
        let birthNum = Int(birthdays.count + 1)
        let birthday  = Int(arc4random_uniform(UInt32(birthNum)))
        let birthdayFinal = (birthdays[birthday])
        birthdayLabel.text = "\(birthdayFinal)"
        fingerprint.image = UIImage(named: "fingerprint.jpg")
        
  
            if nameSwitch != true{
                
                
                if gender == "Male"{
                    nameField.text = "\(customNameInput!)"
                }else if gender == "Female"{
                    nameField.text = "\(customNameInput!)"
                    
                }
                
                
                
                
                
                
            }else if nameSwitch != true{
                if gender == "Male"{
                    nameField.text = "\(theboyName)"
                    nameField.hidden = false
                }else if gender == "Female"{
                    nameField.text = "\(thegirlName)"
                    nameField.hidden = false
                    
                }
            
            
        }
        if imageSwitch.on == false{
        if gender == "Male"{
            
            var maleImage = arc4random_uniform(5)
            
            if maleImage == 1{
                
                theImage.image = UIImage(named: "male1.jpg")
            }else if maleImage == 2{
                theImage.image = UIImage(named: "male2.jpg")
            }else if maleImage == 3{
                theImage.image = UIImage(named: "male3.jpg")
            }else if maleImage == 4{
                theImage.image = UIImage(named: "male4.jpg")
            }
            
            
        }else if gender == "Female"{
            var femaleImage = arc4random_uniform(5)
            if femaleImage == 1{
                
                theImage.image = UIImage(named: "female1.jpg")
            }else if femaleImage == 2{
                theImage.image = UIImage(named: "female2.jpg")
            }else if femaleImage == 3{
                theImage.image = UIImage(named: "female3.jpg")
            }else if femaleImage == 4{
                theImage.image = UIImage(named: "female4.jpg")
            }
            
        }
        
    
        }
        
    
    }
    
    func timerWentOff(){
        timer++
        if timer == 15 {
            timer = 0
            loadAd()
            
        }
        
        
        
        
    }

    @IBAction func generate(sender: AnyObject) {
               
       if genderSwitch.on == true{
            gender = "Female"
        }else{
            gender = "Male"
        }
        if nameSwitch.on == true{
            name = "Random Name"
        }else{
            name = "Custom Name"
            
            
            
        }
        if imageSwitch.on == true{
            image = "Real Image"
            
            //here is camera
            
            
            func selectPicture() {
                let picker = UIImagePickerController()
                picker.allowsEditing = true
                picker.delegate = self
                presentViewController(picker, animated: true, completion: nil)
            }
            theImage.hidden = true
        selectPicture()
            
            
            
        }else{
            image = "Random Image"
        }
        
        if name == "Real Name"{
         
            
            
        }
        
        if name == "Custom Name" {
            customName.hidden = false
            
        
            
            
            
        }
        
        
        print(gender,name,image)
        if gender == "Male"{
            var boyNameNum = Int(arc4random_uniform(UInt32(maleNames.count)))
            theboyName = maleNames[boyNameNum]
            print(theboyName)
            
            genderSwitch.hidden = true
            nameSwitch.hidden = true
            imageSwitch.hidden = true
            generateO.hidden = true
            maleO.hidden = true
            femaleO.hidden = true
            CNO.hidden = true
            RNO.hidden = true
            FIO.hidden = true
            RIO.hidden = true
            enterD.hidden = false
            Gen2O.hidden = false
            if nameSwitch.on != true {
                
                customName.hidden = false
            }
            if nameSwitch.on == true{
                fakeName!.hidden = true
                fakeName!.text = "Your name is \(theboyName)"
            }
            

        }else if gender == "Female"{
            var girlNameNum = Int(arc4random_uniform(UInt32(femaleNames.count)))
             thegirlName = femaleNames[girlNameNum]
            print(thegirlName)
            
            genderSwitch.hidden = true
            nameSwitch.hidden = true
            imageSwitch.hidden = true
            generateO.hidden = true
            maleO.hidden = true
            femaleO.hidden = true
            CNO.hidden = true
            RNO.hidden = true
            FIO.hidden = true
            RIO.hidden = true
            enterD.hidden = false
            Gen2O.hidden = false
            if nameSwitch.on != true{
                customName.hidden = false
            }
            if nameSwitch.on == true{
                fakeName!.hidden = false
            }
             fakeName!.text = "Your name is \(thegirlName)"
            
            
        
    }
    }
    
    func close(sender: UIButton) {
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()
    }

    
    func loadAd() {
        print("load ad")
        interAd = ADInterstitialAd()
        interAd.delegate = self
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
        print("failed to receive")
        print(error.localizedDescription)
        
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()
        
    }


    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        print("Unloaded")
    }
    func interstitialAdDidLoad(interstitialAd: ADInterstitialAd!) {
        print("ad did load")
        
        interAdView = UIView()
        interAdView.frame = self.view.bounds
        view.addSubview(interAdView)
        
        interAd.presentInView(interAdView)
        UIViewController.prepareInterstitialAds()
        
        interAdView.addSubview(closeButton)
    }
    
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
              self.canDisplayBannerAds = true
        loadAd()
        
        
        closeButton.frame = CGRectMake(10, 10, 20, 20)
        closeButton.layer.cornerRadius = 10
        closeButton.setTitle("x", forState: .Normal)
        closeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        closeButton.backgroundColor = UIColor.whiteColor()
        closeButton.layer.borderColor = UIColor.blackColor().CGColor
        closeButton.layer.borderWidth = 1
        closeButton.addTarget(self, action: "close:", forControlEvents: UIControlEvents.TouchDown)
        
        
        genderSwitch.hidden = false
        nameSwitch.hidden = false
        imageSwitch.hidden = false
        generateO.hidden = false
        CNO.hidden = false
        RNO.hidden = false
        FIO.hidden = false
        RIO.hidden = false
        enterD.hidden = true
        customName.hidden = true
        Gen2O.hidden = true
        fakeName!.hidden = true
        theImage.hidden = false
        IDTitle.hidden = true
        nameField.hidden = true
        fingerprint.hidden = true
        birthdayLabel.hidden = true
        serialNumberLabel.hidden = true
        USALogo.hidden = true
        flagO.hidden = true
        disclaimer.hidden = true
        resetButtonO.hidden = true
        picker.delegate = self
        
        
        
        
        theImage.transform = CGAffineTransformMakeRotation(171.2)
         IDTitle.transform = CGAffineTransformMakeRotation(171.2)
        nameField.transform = CGAffineTransformMakeRotation(171.2)
        fingerprint.transform = CGAffineTransformMakeRotation(171.2)
        birthdayLabel.transform = CGAffineTransformMakeRotation(171.2)
         serialNumberLabel.transform = CGAffineTransformMakeRotation(171.2)
        USALogo.transform = CGAffineTransformMakeRotation(171.2)
         flagO.transform = CGAffineTransformMakeRotation(171.2)
         disclaimer.transform = CGAffineTransformMakeRotation(171.2)
        resetButtonO.transform = CGAffineTransformMakeRotation(171.2)
        
    }
            

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        // do something interesting here!
        theImage.image = newImage
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
}
    
    


