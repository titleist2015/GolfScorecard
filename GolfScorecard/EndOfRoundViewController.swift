//
//  EndOfRoundViewController.swift
//  GolfScorecard
//
//  Created by Will Concannon on 7/20/15.
//  Copyright (c) 2015 Concannon Computing. All rights reserved.
//

import UIKit

class EndOfRoundViewController: UIViewController {
    
    var finalScoreView = Int()
    var allHoles = [Hole]()
    var info = EndOfRoundInfo()
    var numOfHolesPlayed = Int()

    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = allHoles.count
        
        for i in 0...(count - 1) {
            let thisIndex = allHoles [ i + 1 ]
            if let possibleIndex = thisIndex as ArraySlice? {
                if allHoles[i].number ==  possibleIndex.number  {
                        allHoles.removeAtIndex(i)
                    }
                    else {
                        println("NIL")
                    }
                }
        }
        
        // ************ fix addidng too much too array problem up top 
//            else {
//                if allHoles[i].number == allHoles[i - 1].number {
//                    allHoles.removeAtIndex(i)
//                }
//            }
        
        info.allHoles = allHoles
        parLabel.text = info.relativeToPar
        finalScoreLabel.text = "\(info.totalScore)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
