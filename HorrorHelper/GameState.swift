//
//  GameState.swift
//  HorrorHelper
//
//  Created by Matthew McLean on 12/14/17.
//  Copyright © 2017 McLeanSoft. All rights reserved.
//

import Foundation

class GameState {
    private var players: Int
    var currentMessage: String?
    
    private var monstersTown: Int
    private var monstersOutskirts: Int
    private var gatesOpen: Int
    private var gatesSealed: Int
    
    let maximumGatesSealed: Int = 6
    
    private var maximumMonstersOutskirts: Int
    private var maximumGatesOpen: Int
    
    private enum Phase {
        case upkeep
        case movement
        case arkhamEncounters
        case otherworldEncounters
        case mythos
    }
    
    init() {
        players = 0
        currentMessage = "Welcome to Horror Helper! Please adjust the number of players to get started. Then, press next when you're ready to begin the game."
        monstersTown = 0
        monstersOutskirts = 0
        gatesOpen = 0
        gatesSealed = 0
        maximumMonstersOutskirts = 100
        maximumGatesOpen = 100
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
    }
    
    public func changeGatesOpen(newNumGates: Int) {
        if newNumGates >= maximumGatesOpen {
            currentMessage = "The Ancient One awakens! Please enter combat at your earliest convenience."
        }
    }
}
