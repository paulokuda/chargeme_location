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
    
    @IBAction func facebookLogin(sender: AnyObject) {
        Utils.logInWithFacebook()
//        nameLabel.text = PFUser.currentUser().username
    }
    @IBOutlet weak var nameLabel: UILabel!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Notification testing
    


}
