//
//  RoundDetailsViewController.swift
//  GolfScorecard
//
//  Created by Will Concannon on 7/12/15.
//  Copyright (c) 2015 Concannon Computing. All rights reserved.
//

import UIKit

class RoundDetailsViewController: UIViewController {
    
    var numOfPlayers = Int()
    var selectedNumOfHoles = 0
    
    @IBOutlet weak var selectedPlayerName: UITextField!
    @IBOutlet weak var numberOfHolesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numOfPlayersSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if numberOfHolesSegmentedControl.selectedSegmentIndex == 0 {
            selectedNumOfHoles = 9
        }
        else if numberOfHolesSegmentedControl == 1 {
            selectedNumOfHoles = 18
        }
        else {
            println("Error in View Did Load of Round Details View Controller")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeInNumOfHoles(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            selectedNumOfHoles = 9
        }
        else if sender.selectedSegmentIndex == 1 {
            selectedNumOfHoles = 18
        }
        else {
            println("Error in changeInNumOfHOles function of Round Details View Controller")

        }
    
    }
    
    @IBAction func changeNumOfPlayers(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            numOfPlayers = 1
        }
        else if sender.selectedSegmentIndex == 1 {
            numOfPlayers = 2
        }
        else if sender.selectedSegmentIndex == 2 {
            numOfPlayers = 3
        }
        else if sender.selectedSegmentIndex == 3 {
            numOfPlayers = 4
        }
        else {
            println("Error in changeInNumOfPlayers function of Round Details View Controller")
        }

    }
    
    @IBAction func submit() {
        var confirmationAlert = UIAlertController(title: "Begin Round", message: "Are these your desired settings?", preferredStyle: UIAlertControllerStyle.Alert)
        
        confirmationAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        confirmationAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
                self.performSegueWithIdentifier("RoundDetailsToHoleOne", sender: self)
        }))
        
        presentViewController(confirmationAlert, animated: true, completion: nil)

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RoundDetailsToHoleOne"{
            let firstHoleViewController: EnterHoleInfoViewController = segue.destinationViewController as! EnterHoleInfoViewController
            firstHoleViewController.holeNum = 1
        }
    }
}









