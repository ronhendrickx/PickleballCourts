//
//  ViewController.swift
//  PickleballCourts
//
//  Created by Ronny Hendrickx on 2/24/16.
//  Copyright © 2016 Ronny Hendrickx. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var defaultStepper: UIStepper!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func assignButton(sender: UIButton) {
        setPlayers(Int(defaultStepper.value))
        
    }
    
    @IBAction func valueDidCahnge(sender: UIStepper) {
        
        label.text = "\(Int(sender.value))"
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureStepper()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureStepper(){
        defaultStepper.value = 1
        //defaultStepper.addTarget(self, action: "valueDidChange:", forControlEvents: .ValueChanged)
        label.text = "\(Int(defaultStepper.value))"
    }
    
    func setPlayers(counter: Int){
        
        let count = counter
        var players = [Int] (1...count)
        players = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(players) as! [Int]
        var playersCounter = players.count
        if playersCounter < 16 { playersCounter = 16}
        
        
        for i in 0..<playersCounter {
            
            if let theLabel = self.view.viewWithTag(i+1) as? UILabel {
                if i < players.count {
                    theLabel.text = (String)(players[i])
                } else {
                    theLabel.text = ""
                }
            }
            
            
        }
    }

}

