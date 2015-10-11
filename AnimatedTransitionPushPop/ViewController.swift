//
//  ViewController.swift
//  AnimatedTransitionPushPop
//
//  Created by Steven Gibson on 10/10/15.
//  Copyright © 2015 AG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var spinManager = PushSpinTransition()
    var popManager = PopCustomTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func spinPushDidPress(sender: AnyObject) {
        self.performSegueWithIdentifier("seg", sender: "spinPush")
    }
    
    
    @IBAction func popTransitionDidPress(sender: AnyObject) {
        
        self.performSegueWithIdentifier("seg", sender: "pop")
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let type = sender as? String
        if type == "spinPush"{
            let dvc = segue.destinationViewController as! SecondVCViewController
            dvc.transitioningDelegate = spinManager
        
        }
        else{
            // time to pop
            let dvc = segue.destinationViewController as! SecondVCViewController
            
            dvc.transitioningDelegate = popManager
        }
        
    }

}

