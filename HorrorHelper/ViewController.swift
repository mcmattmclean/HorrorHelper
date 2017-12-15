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
        updateDescription()
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
    @IBOutlet weak var numberPlayersStepper: UIStepper!
    
    @IBOutlet weak var gateOpenLabel: UILabel!
    @IBOutlet weak var gateSealedLabel: UILabel!
    @IBOutlet weak var monsterTownLabel: UILabel!
    @IBOutlet weak var monsterOutskirtLabel: UILabel!
    @IBOutlet weak var numberPlayersLabel: UILabel!
    
    private var game: GameState = GameState()
    
    private func updateDescription(){
        descriptionField.text = game.currentMessage
        phaseHeaderLabel.text = game.phaseHeader
        if game.currentPhase == .alert {
            phaseHeaderLabel.textColor = UIColor.red
        }
        else if game.currentPhase == .start {
            phaseHeaderLabel.textColor = UIColor.green
        }
        else {
            phaseHeaderLabel.textColor = UIColor.cyan
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        game.reset()
        updateDescription()
        gateSealedLabel.text = "0"
        gateSealedStepper.value = 0
        gateOpenLabel.text = "0"
        gateOpenStepper.value = 0
        monsterTownLabel.text = "0"
        monsterTownStepper.value = 0
        monsterOutskirtLabel.text = "0"
        numberPlayersLabel.text = "0"
        numberPlayersStepper.value = 0
    }
    
    @IBAction func nextPhase(_ sender: UIButton) {
        game.advancePhase()
        updateDescription()
    }
    
    @IBAction func revertPhase(_ sender: UIButton) {
        game.goBackPhase()
        updateDescription()
    }
    
    @IBAction func gateOpenChanged(_ sender: UIStepper) {
        game.changeGatesOpen(newNumGates: Int(sender.value))
        gateOpenLabel.text = String(game.gatesOpen)
        gateOpenStepper.value = Double(game.gatesOpen)
        updateDescription()
    }
    @IBAction func gateSealedChanged(_ sender: UIStepper) {
        game.changeGatesSealed(newNumGates: Int(sender.value))
        gateSealedLabel.text = String(game.gatesSealed)
        gateSealedStepper.value = Double(game.gatesSealed)
        updateDescription()
    }
    @IBAction func monsterTownChanged(_ sender: UIStepper) {
        game.changeMonstersTown(newNumMonsters: Int(sender.value))
        monsterTownLabel.text = String(game.monstersTown)
        monsterOutskirtLabel.text = String(game.monstersOutskirts)
        monsterTownStepper.value = Double(game.monstersTown)
        updateDescription()
    }
    
    @IBAction func numberPlayersChanged(_ sender: UIStepper) {
//        numberPlayersLabel.text = String(Int(sender.value))
        game.setGameConstraints(numPlayers: Int(sender.value))
        numberPlayersLabel.text = String(game.players)
    }
}

