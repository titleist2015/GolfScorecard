//
//  EnterHoleInfoViewController.swift
//  GolfScorecard
//
//  Created by Will Concannon on 7/13/15.
//  Copyright (c) 2015 Concannon Computing. All rights reserved.
//

import UIKit

class EnterHoleInfoViewController: UIViewController {
    
//    var holeNum = Int()
//    var scoresEntered = [Int()]
//    var finalScore = Int()
//    var holePar = Int()
//    var parsEntered = [Int()]
//    var finalPar = Int()
    
    var allHoles: [Hole] = []
    var thisHole = Hole()
    var backNum = 0
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var selectedParSegmentControl: UISegmentedControl!
    @IBOutlet weak var enteredScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in allHoles {
            println("view did load")
            println(x.holeInfo)
        }


        if thisHole.number == 1 {
            backButton.enabled = false
            backButton.title = ""
        }
        else {
            backButton.title = "Hole \(thisHole.number - 1)"
        }
        enteredScoreTextField.becomeFirstResponder()
        title = "Hole Number \(thisHole.number)"
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nextHole() {
        
        if let enteredScore = enteredScoreTextField.text.toInt(){
        }
        else {
            showAlert()
        }
        
        switch selectedParSegmentControl.selectedSegmentIndex {
        case 0: thisHole.par = 3
        case 1: thisHole.par = 4
        case 2: thisHole.par = 5
        default: println("error in next hole")
        }
        if let score = enteredScoreTextField.text.toInt() {
            thisHole.score = score
        }
    
        let nextHole = self.storyboard?.instantiateViewControllerWithIdentifier("EnterHoleInfo") as! EnterHoleInfoViewController
        
        nextHole.thisHole.number = thisHole.number + 1
        
        allHoles.append(thisHole)
        
        nextHole.allHoles = allHoles
        
        println("next hole")
        for x in allHoles {
            println(x.holeInfo)
        }
        
        
        println(back)

        
        self.navigationController?.pushViewController(nextHole, animated: true)
    }

     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "HoleInfoToEndOfRound" {
            switch selectedParSegmentControl.selectedSegmentIndex {
            case 0: thisHole.par = 3
            case 1: thisHole.par = 4
            case 2: thisHole.par = 5
            default: println("error in prepareForSegue")
            }
            if let score = enteredScoreTextField.text.toInt() {
                thisHole.score = score
            }
            
            allHoles.append(thisHole)
            
            println("finishround")
            for x in allHoles {
                println(x.holeInfo)
            }


            
            let endOfRound = segue.destinationViewController as! EndOfRoundViewController
            endOfRound.numOfHolesPlayed = thisHole.number
            endOfRound.allHoles = allHoles
            

        }
      
    }
    
    func addDoneButtonOnKeyboard() {
        var doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        
        var flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        var done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneButtonAction"))
        
        var items = NSMutableArray()
        items.addObject(flexSpace)
        items.addObject(done)
        
        doneToolbar.items = items as [AnyObject]
        doneToolbar.sizeToFit()
        
        enteredScoreTextField.inputAccessoryView = doneToolbar
        enteredScoreTextField.inputAccessoryView = doneToolbar
        
    }
    
    func doneButtonAction()
    {
        enteredScoreTextField.resignFirstResponder()
        enteredScoreTextField.resignFirstResponder()
    }
    
    func showAlert(){
        var noScoreEnteredAlert = UIAlertController(title: "No Score Entered", message: "You didn't enter a score for this hole. Enter one now.", preferredStyle: UIAlertControllerStyle.Alert)
        
        noScoreEnteredAlert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        
        presentViewController(noScoreEnteredAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func finishRound(sender: AnyObject) {
        
        if enteredScoreTextField.text.toInt() == nil{
            showAlert()
        }
        else {
            
            performSegueWithIdentifier("HoleInfoToEndOfRound", sender: self)
        }
    }
    
    // work for editingPreviousHOles
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        if (!(parent?.isEqual(self.parentViewController) ?? false)) {
            
        }
    }
////
//    func back(sender: UIBarButtonItem) {
//        println("testback")
//        navigationController?.popViewControllerAnimated(true)
//    }
    
    @IBAction func back(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
        println("Before remove")
        println(thisHole.number)
        backNum = thisHole.number - 2
        for x in allHoles {
            println(x.holeInfo)
        }
        
        println(backNum)
        
        println("after remove")
 
        allHoles.removeAtIndex(backNum)
        for x in allHoles {
            println(x.holeInfo)
        }

    }

}




