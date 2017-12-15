//
//  ViewController.swift
//  HorrorHelper
//
//  Created by Matthew McLean on 12/13/17.
//  Copyright © 2017 McLeanSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var phaseHeaderLabel: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var nextPhaseButton: UIButton!
    @IBOutlet weak var previousPhaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var gateOpenStepper: UIStepper!
    @IBOutlet weak var gateSealedStepper: UIStepper!
    @IBOutlet weak var monsterTownStepper: UIStepper!
    @IBOutlet weak var monsterOutskirtStepper: UIStepper!
    @IBOutlet weak var numberPlayersStepper: UIStepper!
    
    @IBOutlet weak var gateOpenLabel: UILabel!
    @IBOutlet weak var gateSealedLabel: UILabel!
    @IBOutlet weak var monsterTownLabel: UILabel!
    @IBOutlet weak var monsterOutskirtLabel: UILabel!
    @IBOutlet weak var numberPlayersLabel: UILabel!
    
    private var game: GameState = GameState()
    
    @IBAction func gateOpenChanged(_ sender: UIStepper) {
//        gateOpenLabel.text = String(Int(sender.value))
        game.changeGatesOpen(newNumGates: Int(sender.value))
    }
    @IBAction func gateSealedChanged(_ sender: UIStepper) {
//        gateSealedLabel.text = String(Int(sender.value))
    }
    @IBAction func monsterTownChanged(_ sender: UIStepper) {
//        monsterTownLabel.text = String(Int(sender.value))
    }
    @IBAction func monsterOutskirtChanged(_ sender: UIStepper) {
//        monsterOutskirtLabel.text = String(Int(sender.value))
    }
    @IBAction func numberPlayersChanged(_ sender: UIStepper) {
//        numberPlayersLabel.text = String(Int(sender.value))
        game.setGameConstraints(numPlayers: Int(sender.value))
    }
}

