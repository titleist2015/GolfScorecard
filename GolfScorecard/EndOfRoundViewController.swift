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
    var finalPar = Int()
    var relativeToPar = Int()

    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        finalScoreLabel.text = "\(finalScoreView)"
        
        relativeToPar = finalScoreView - finalPar
        
        if relativeToPar > 0 {
            parLabel.text = "+ \(relativeToPar)"
        }
        else if relativeToPar == 0 {
            parLabel.text = "E"
        }
        else if relativeToPar < 0 {
            parLabel.text = "\(relativeToPar)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
