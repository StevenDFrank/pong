//
//  GameSettings.swift
//  BeerPong
//
//  Created by Steven Frank on 11/20/16.
//  Copyright © 2016 Steven Frank. All rights reserved.
//

import Foundation

class GameSettings {
    
    static let sharedInstance = GameSettings()
    
    // MARK: - Private class constants
    private let defaults = UserDefaults.standard
    private let keyFirstRun = "FirstRun"
    private let keyL1BestScore = "BestScore"
    
    // MARK: - Init
    init() {
        if defaults.object(forKey: keyFirstRun) == nil {
            firstLaunch()
        }
    }
    
    // MARK: - Private methods
    private func firstLaunch() {
        defaults.set(0, forKey: keyL1BestScore)
        defaults.set(false, forKey: keyFirstRun)
        
        defaults.synchronize()
    }
    
    // MARK: - Public saving methods 
    func saveBestScore(score: Int) {
        defaults.set(score, forKey: keyL1BestScore)
        
        defaults.synchronize()
    }
    
    // MARK: - Public retrieving methods
    func getBestScore() -> Int {
        return defaults.integer(forKey: keyL1BestScore)
    }
}
