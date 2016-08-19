//
//  ViewController.swift
//  GoForAWalk
//
//  Created by Kathryn Smith on 8/18/16.
//  Copyright © 2016 Kathryn Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let clock = Clock()
    var timer: NSTimer?
    @IBOutlet var homeLabel: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(45.0, target: self, selector: #selector(ViewController.pushWalkAlert), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        pushWalkAlert()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pushWalkAlert() {
        let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        print(hour)
        if hour >= 10 && hour <= 17 {
            alertUser()
        }
    }
    
    func alertUser() {
        let alertController = UIAlertController(title: "Go go go!", message: "Time for a walk! Its been 45 minutes of sitting!", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: {(alert: UIAlertAction!) -> Void in })
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }


}

