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
    var scoresEntered = [Int()]
    var finalScore = Int()
    var holePar = Int()
    var parsEntered = [Int()]
    var finalPar = Int()
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var selectedParSegmentControl: UISegmentedControl!
    @IBOutlet weak var enteredScoreTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()
        
        navBar.title = "Hole Number \(holeNum)"
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nextHole() {
        
        let (nextHoleNum, nextHoleFinalScore, nextHoleFinalPar) = submitResults()
        
        let nextHole = self.storyboard?.instantiateViewControllerWithIdentifier("EnterHoleInfo") as! EnterHoleInfoViewController
        
        nextHole.holeNum = nextHoleNum
        nextHole.finalScore = nextHoleFinalScore
        nextHole.finalPar = nextHoleFinalPar
        
        self.navigationController?.pushViewController(nextHole, animated: true)
    }
    
    func submitResults() -> (Int, Int, Int) {
        var nextHoleNum = holeNum + 1
        var nextFinalScore = Int()
        if let enteredText = enteredScoreTextField.text.toInt() {
            scoresEntered.append(enteredText)
            nextFinalScore = scoresEntered.reduce(0, combine: +)
        }
        else {
            var noScoreEnteredAlert = UIAlertController(title: "No Score Entered", message: "You didn't enter a score for this hole. Enter one now.", preferredStyle: UIAlertControllerStyle.Alert)
            
            noScoreEnteredAlert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))

            presentViewController(noScoreEnteredAlert, animated: true, completion: nil)
            
        }
        
        var selectedPar = Int()
        
        switch selectedParSegmentControl.selectedSegmentIndex {
        case 0: selectedPar = 3
        case 1: selectedPar = 4
        case 2: selectedPar = 5
        default: println("error in switch statement of submitResults()")
        }
        
        parsEntered.append(selectedPar)
        
        var nextFinalPar = parsEntered.reduce(0, combine: +)
        
        return (nextHoleNum, nextFinalScore, nextFinalPar)
    
    }
    
    @IBAction func finishRound(sender: AnyObject) {
        
        performSegueWithIdentifier("HoleInfoToEndOfRound", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var selectedPar = Int()
        
        switch selectedParSegmentControl.selectedSegmentIndex {
        case 0: selectedPar = 3
        case 1: selectedPar = 4
        case 2: selectedPar = 5
        default: println("error in switch statement of prepareForSegue")
        }
        
        if segue.identifier == "HoleInfoToEndOfRound" {
            let endOfRound = segue.destinationViewController as! EndOfRoundViewController
        
            if let enteredText = enteredScoreTextField.text.toInt(){
                endOfRound.finalScoreView = finalScore + enteredText
            }
            
            endOfRound.finalPar = finalPar + selectedPar
        
        }
        
    }
    
    func addDoneButtonOnKeyboard()
    {
        var doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        
        var flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        var done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneButtonAction"))
        
        var items = NSMutableArray()
        items.addObject(flexSpace)
        items.addObject(done)
        
        doneToolbar.items = items as [AnyObject]
        doneToolbar.sizeToFit()
        
        self.enteredScoreTextField.inputAccessoryView = doneToolbar
        self.enteredScoreTextField.inputAccessoryView = doneToolbar
        
    }
    
    func doneButtonAction()
    {
        self.enteredScoreTextField.resignFirstResponder()
        self.enteredScoreTextField.resignFirstResponder()
    }
    
    
    
}










