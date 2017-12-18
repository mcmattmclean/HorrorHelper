//
//  GameState.swift
//  HorrorHelper
//
//  Created by Matthew McLean on 12/14/17.
//  Copyright © 2017 McLeanSoft. All rights reserved.
//

import Foundation

class GameState {
    var players: Int
    var phaseHeader: String?
    var currentMessage: String?
    var currentPhase: Phase
    private var oldPhase: Phase
    
    var monstersTown: Int
    var monstersOutskirts: Int
    var gatesOpen: Int
    var gatesSealed: Int
    
    // Game rules for sealed gate victory doesn't change with number of players (always 6)
    let maximumGatesSealed: Int = 6
    
    private var maximumMonstersOutskirts: Int {
        get {
            return 8 - players
        }
    }
    private var maximumMonstersTown: Int {
        get {
            return players + 3
        }
    }
    private var maximumGatesOpen: Int {
        get {
            if players < 3 {
                return 8
            }
            else if players < 5 {
                return 7
            }
            else if players < 7 {
                return 6
            }
            else {
                return 5
            }
        }
    }
    
    enum Phase {
        case start
        case alert
        case upkeep
        case movement
        case arkhamEncounters
        case otherworldEncounters
        case mythos
    }
    
    private func updatePhaseString() {
        switch currentPhase {
        case .upkeep:
            currentMessage = "Do upkeep stuff"
            phaseHeader = "Upkeep"
        case .movement:
            currentMessage = "Do movement stuff"
            phaseHeader = "Movement"
        case .arkhamEncounters:
            currentMessage = "Do arkham encounters stuff"
            phaseHeader = "Arkham Encounters"
        case .otherworldEncounters:
            currentMessage = "Otherworld stuff"
            phaseHeader = "Otherworld Encounters"
        case .mythos:
            currentMessage = "Do mythos stuff"
            phaseHeader = "Mythos"
        case .start:
            currentMessage = "Please adjust the number of players to get started. Then, press next when you're ready to begin the game."
            phaseHeader = "Welcome to Horror Helper!"
        case .alert:
            break
        }
    }
    
    init() {
        players = 0
        currentMessage = ""
        phaseHeader = ""
        monstersTown = 0
        currentPhase = .start
        oldPhase = .start
        monstersOutskirts = 0
        gatesOpen = 0
        gatesSealed = 0
        updatePhaseString()
    }
    
    public func reset() {
        players = 0
        currentMessage = "Game reset"
        phaseHeader = ""
        monstersTown = 0
        currentPhase = .start
        oldPhase = .start
        monstersOutskirts = 0
        gatesOpen = 0
        gatesSealed = 0
        updatePhaseString()
    }
    
    public func changeGatesOpen(newNumGates: Int) {
        if newNumGates >= maximumGatesOpen {
            currentMessage = "The Ancient One awakens! Please enter combat at your earliest convenience."
            phaseHeader = "Uh oh!"
            currentPhase = .alert
            updatePhaseString()
        }
        gatesOpen = newNumGates
    }
    
    public func changeGatesSealed(newNumGates: Int) {
        if newNumGates >= maximumGatesSealed {
            currentMessage = "You've sealed 6 gates! The Ancient One has been defeated... this time..."
            currentPhase = .alert
            phaseHeader = "Game Over"
            updatePhaseString()
        }
        gatesSealed = newNumGates
    }
    
    public func changeMonstersTown(newNumMonsters: Int) {
        // Handle monsters over town limit
        if newNumMonsters > maximumMonstersTown {
            currentMessage = "Monster limit reached! Monster goes to outskirts."
            monstersOutskirts += 1
            phaseHeader = "Monsters are everywhere!"
            
            // Handle monsters over outskirts limit
            if monstersOutskirts > maximumMonstersOutskirts {
                currentMessage = "Monsters have flooded the outskirts! Empty the outskirts and raise the terror level by one!"
                phaseHeader = "Terror grips Arkham!"
                monstersOutskirts = 0
            }
            currentPhase = .alert
            updatePhaseString()
        }
        else {
            monstersTown = newNumMonsters
        }
        
    }
    
    public func advancePhase () {
        switch currentPhase {
        case .start:
            currentPhase = .upkeep
        case .upkeep:
            currentPhase = .movement
        case .movement:
            currentPhase = .arkhamEncounters
        case .arkhamEncounters:
            currentPhase = .otherworldEncounters
        case .otherworldEncounters:
            currentPhase = .mythos
        case .mythos:
            currentPhase = .upkeep
        case .alert:
            currentPhase = oldPhase //Get phase from before alert and reset to that phase
            goBackPhase()
            advancePhase()
        }
        updatePhaseString()
        oldPhase = currentPhase
    }
    
    public func goBackPhase () {
        switch currentPhase {
        case .start:
            break
        case .upkeep:
            currentPhase = .mythos
        case .movement:
            currentPhase = .upkeep
        case .arkhamEncounters:
            currentPhase = .movement
        case .otherworldEncounters:
            currentPhase = .arkhamEncounters
        case .mythos:
            currentPhase = .otherworldEncounters
        default:
            currentPhase = oldPhase
            advancePhase()
            goBackPhase()
        }
        updatePhaseString()
        oldPhase = currentPhase
    }
}
