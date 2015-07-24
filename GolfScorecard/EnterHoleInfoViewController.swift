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
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var selectedParSegmentControl: UISegmentedControl!
    @IBOutlet weak var enteredScoreTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "Hole Number \(holeNum)"
        println("\(finalScore)")
        println("\(finalPar)")
        
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
        var nextFinalscore = Int()
        if let enteredText = enteredScoreTextField.text.toInt() {
            var nextFinalScore = finalScore + enteredText
        }
        
        var selectedPar = Int()
        
        switch selectedParSegmentControl.selectedSegmentIndex {
        case 0: selectedPar = 3
        case 1: selectedPar = 4
        case 2: selectedPar = 5
        default: println("error in switch statement of submitResults()")
        }
        
        var nextFinalPar = finalPar + selectedPar
        
        return (nextHoleNum, nextFinalscore, nextFinalPar)
    
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
        default: println("error in switch statement of submitResults()")
        }
        
        if segue.identifier == "HoleInfoToEndOfRound" {
            let endOfRound = segue.destinationViewController as! EndOfRoundViewController
        
            if let enteredText = enteredScoreTextField.text.toInt(){
                endOfRound.finalScoreView = finalScore + enteredText
            }
            
            endOfRound.finalPar = finalPar + selectedPar
        
        }
        
    }
    
    // ************** GET DATA ON END OF ROUND RIGHT ******************
    
    
}










