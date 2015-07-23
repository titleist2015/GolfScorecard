//
//  EnterHoleInfoViewController.swift
//  GolfScorecard
//
//  Created by Will Concannon on 7/13/15.
//  Copyright (c) 2015 Concannon Computing. All rights reserved.
//

import UIKit

class EnterHoleInfoViewController: UIViewController {
    
    var holeNum = Int()
    var finalScore = Int()
    var holePar = Int()
    var finalPar = Int()
    // git test
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var nextHoleButton: UIButton!
    @IBOutlet weak var selectedParSegmentedControl: UISegmentedControl!
    @IBOutlet weak var enteredScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.title = "Hole Number \(holeNum)"
        enteredScoreTextField.keyboardType = UIKeyboardType.NumberPad
        
        if holeNum == 1 {
            self.navBar.hidesBackButton = true
        }
        else if holeNum == 18 {
            nextHoleButton.setTitle("Finish Round", forState: .Normal)
        }
        else {
            self.navBar.hidesBackButton = false
            navBar.leftBarButtonItem?.title = "test"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func finishRound() {
        submitInfo()
        performSegueWithIdentifier("HoleInfoToEndOfRound", sender: AnyObject?())
    }
    
    @IBAction func nextHole() {
        
        if nextHoleButton.currentTitle == "Finish Round"{
            finishRound()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NextHole"{
            submitInfo()
            let newInstance: EnterHoleInfoViewController = segue.destinationViewController as! EnterHoleInfoViewController
            newInstance.holeNum = (holeNum + 1)
            newInstance.finalScore = finalScore
            newInstance.finalPar = finalPar
        }
        else if segue.identifier == "HoleInfoToEndOfRound"{
            let endOfRound: EndOfRoundViewController = segue.destinationViewController as! EndOfRoundViewController
            endOfRound.finalScoreView = finalScore
            endOfRound.finalPar = finalPar
        }
    }
    
    func submitInfo() {
        
        if let scoreEntered = enteredScoreTextField.text.toInt(){
            finalScore += scoreEntered
        }
        
        switch selectedParSegmentedControl.selectedSegmentIndex{
        case 0:
            holePar = 3
        case 1:
            holePar = 4
        case 2:
            holePar = 5
        default:
            println("Error in submitInfo")
        }
        
        finalPar += holePar
    }
    
}










