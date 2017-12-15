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
    private var currentPhase: Phase
    private var oldPhase: Phase
    
    var monstersTown: Int
    var monstersOutskirts: Int
    var gatesOpen: Int
    var gatesSealed: Int
    
    let maximumGatesSealed: Int = 6
    
    private var maximumMonstersOutskirts: Int
    private var maximumMonstersTown: Int
    private var maximumGatesOpen: Int
    
    private enum Phase {
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
        maximumMonstersOutskirts = 100
        maximumMonstersTown = 100
        maximumGatesOpen = 100
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
        maximumMonstersOutskirts = 100
        maximumMonstersTown = 100
        maximumGatesOpen = 100
        updatePhaseString()
    }
    
    public func setGameConstraints(numPlayers: Int) {
        players = numPlayers
        if numPlayers < 3 {
            maximumGatesOpen = 8
        }
        else if numPlayers < 5 {
            maximumGatesOpen = 7
        }
        else if numPlayers < 7 {
            maximumGatesOpen = 6
        }
        else {
            maximumGatesOpen = 5
        }
        maximumMonstersOutskirts = 8 - numPlayers
        maximumMonstersTown = numPlayers + 3
    }
    
    public func changeGatesOpen(newNumGates: Int) {
        if newNumGates >= maximumGatesOpen {
            currentMessage = "The Ancient One awakens! Please enter combat at your earliest convenience."
            phaseHeader = "Uh oh!"
            currentPhase = .alert
            updatePhaseString()
        }
        else {
            gatesOpen = newNumGates
        }
    }
    
    public func changeGatesSealed(newNumGates: Int) {
        if newNumGates >= maximumGatesSealed {
            currentMessage = "You've sealed 6 gates! The Ancient One has been defeated... this time..."
            currentPhase = .alert
            phaseHeader = "Game Over"
            updatePhaseString()
        }
        else {
            gatesSealed = newNumGates
        }
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
            updatePhaseString()
        case .upkeep:
            currentPhase = .movement
            updatePhaseString()
        case .movement:
            currentPhase = .arkhamEncounters
            updatePhaseString()
        case .arkhamEncounters:
            currentPhase = .otherworldEncounters
            updatePhaseString()
        case .otherworldEncounters:
            currentPhase = .mythos
            updatePhaseString()
        case .mythos:
            currentPhase = .upkeep
            updatePhaseString()
        case .alert:
            currentPhase = oldPhase //Get phase from before alert and reset to that phase
            goBackPhase()
            advancePhase()
        }
        oldPhase = currentPhase
    }
    
    public func goBackPhase () {
        switch currentPhase {
        case .start:
            break
        case .upkeep:
            currentPhase = .mythos
            updatePhaseString()
        case .movement:
            currentPhase = .upkeep
            updatePhaseString()
        case .arkhamEncounters:
            currentPhase = .movement
            updatePhaseString()
        case .otherworldEncounters:
            currentPhase = .arkhamEncounters
            updatePhaseString()
        case .mythos:
            currentPhase = .otherworldEncounters
            updatePhaseString()
        default:
            currentPhase = oldPhase
            advancePhase()
            goBackPhase()
        }
        oldPhase = currentPhase
    }
}
