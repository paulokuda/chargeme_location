//
//  ViewController.swift
//  chargeme
//
//  Created by Paul Okuda on 3/4/15.
//  Copyright (c) 2015 Paul Okuda. All rights reserved.
//

import UIKit



class VC_Homepage: UIViewController {
    
    @IBOutlet weak var sendnotif: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var textDescription: UITextView!
    
    
    
    //User clicks Login button
    @IBAction func facebookLogin(sender: AnyObject) {
        Utils.logInWithFacebook()
//      nameLabel.text = PFUser.currentUser().username
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if Utils.notLoggedIn(){
//            welcomeLabel.text = "Welcome"
//            nameLabel.text = PFUser.currentUser().username
            textDescription.hidden = false
            welcomeLabel.hidden = true
            nameLabel.hidden = true
        }
        else{
            welcomeLabel.text = "Welcome"
            nameLabel.text = PFUser.currentUser().username
            welcomeLabel.hidden = false
            nameLabel.hidden = false
            textDescription.hidden = true
            facebookLoginButton.hidden = true
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Notification testing: Touching the button immediately sends the notification which is then immediately responded in AppDelegate (didReceiveLocalNotification)
    @IBAction func touch_sendNotif(sender: AnyObject) {
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertAction = "Hi, I am a notification"
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        NSLog("Touched")
    }
    


}

