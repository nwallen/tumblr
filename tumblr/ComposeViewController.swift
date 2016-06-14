//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Nicholas Wallen on 6/12/16.
//  Copyright © 2016 Nicholas Wallen. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet var composeButtons: [UIButton]!
    
    var fadeTransition: FadeTransition!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        for i in 0...composeButtons.count - 1 {
            composeButtons[i].originalCoordinates.center = composeButtons[i].center
            composeButtons[i].frame.origin.y = 568
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        for i in 0...composeButtons.count - 1 {
            UIView.animateWithDuration(0.3, delay: 0.03 * Double(i), options: .CurveEaseOut, animations: { () -> Void in
                    self.composeButtons[i].center = self.composeButtons[i].originalCoordinates.center
                }, completion: nil)
        }
    }
    
    @IBAction func didTapDismiss(sender: AnyObject) {
        
        for i in 0...composeButtons.count - 1 {
            UIView.animateWithDuration(0.3, delay: 0.03 * Double(i), options: .CurveEaseIn, animations: { () -> Void in
                self.composeButtons[i].frame.origin.y = -100
                }, completion: nil)
        }
        delay(0.6){
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }

}
