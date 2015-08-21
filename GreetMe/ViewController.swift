//
//  ViewController.swift
//  GreetMe
//
//  Created by Bliss Chapman on 8/21/15.
//  Copyright © 2015 Bliss Chapman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [UIUserNotificationType.Alert], categories: nil))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sayHiTapped(sender: UIButton) {
        nameTextField.resignFirstResponder()
        
        guard let name = nameTextField.text where name.characters.count >= 1 else {
        
            greetingLabel.text = "Please enter your name in the text field."
            return
        }
        
        greetingLabel.text = "Hi, \(name)!"
        
        let greetingNotification = UILocalNotification()
        greetingNotification.timeZone = NSTimeZone.defaultTimeZone()
        greetingNotification.fireDate = NSDate(timeIntervalSinceNow: 15)
        greetingNotification.alertBody = "It was a pleasure to meet you \(name). I hope to see you again soon!  - ❤️CocoaNutters."
        UIApplication.sharedApplication().scheduleLocalNotification(greetingNotification)
    }
    


}

