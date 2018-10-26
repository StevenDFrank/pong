//
//  Background.swift
//  beerpong
//
//  Created by Steven on 10/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//
/*
import SpriteKit

class Background: SKNode {
    
    // MARK: - Private class constants
    // Here we create two constants for speed
    private let backgroundRunSpeed:CGFloat = 200.0
    private let backgroundStopSpeed:CGFloat = 50.0
    
    // MARK: - Private class variables
    // Here we create three instances of SKEmitterNode and we create an array to store our three particle emitters so we can loop over them to change the speed, color ect.
    private var particlesLarge = SKEmitterNode()
    private var particlesMedium = SKEmitterNode()
    private var particlesSmall = SKEmitterNode()
    private var particlesArray = [SKEmitterNode]()
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.setup()
    }
    
    // MARK: - Setup
    private func setup() {
        
        self.zPosition = -1.0  // Setting the zPosition of this node to -1.0. If you dont specify a zPosition it is given the same zPosition as its parent. A scene has a zPosition of 0, and any children added to it will share this zPosition. By setting the zPosition of Backgroud to -1.0, we are explicitly placing it behind other objects added to the scene. If we didn't do this, the particles would sometimes overlab other sprites which isn't much of a background effect.
        
        // Here we initialize each of the particle emitters using our 'GameParticles' singleton to get a copy of the 'backgroundEmitter'
        // particlesLarge = GameParticles.sharedInstance.createParticles(particles: .background)
        particlesMedium = GameParticles.sharedInstance.createParticles(particles: .background)
        particlesSmall = GameParticles.sharedInstance.createParticles(particles: .background)
        
        // Here we set the scale of each emitter so they come in at different sizes to make it look more interesting
        particlesLarge.particleScale = 1.0
        particlesMedium.particleScale = 0.5
        particlesSmall.particleScale = 0.25
        
        //Each particle emitter is added to the 'particlesArray' array. Then we have a for loop which loops over members in the array and adds them as a child of Background.
        // particlesArray.append(particlesLarge)
        particlesArray.append(particlesMedium)
        particlesArray.append(particlesSmall)
        
        for particles in particlesArray {
            self.addChild(particles)
        }
        
        // We want the particles to be in their idle state at first, so before leaving setup() we call the stopBackround() method defined below
        stopBackground()
    }
    
    // MARK: - Actions
    
    // In 'startBackground()' and 'stopBackground()' we control the speed the particles are moving, and the range. The range is how much variation there can be. So if the 'particleSpeed' is 100.0 and the 'particleSpeedRange' is 25.0, the 'particeSpeed' can be between 125.0 and 75.0. It is more interesting than each particle moving at exactly the same speed.
    
    func startBackground() {
        for particles in particlesArray {
            particles.particleBirthRate = particles.particleBirthRate * 4.0
            particles.particleLifetime = particles.particleLifetime / 4.0
            
            particles.particleSpeed = 180
            particles.particleSpeedRange = backgroundRunSpeed / 4
        }
    }
    
    func stopBackground() {
        for particles in particlesArray {
            particles.particleBirthRate = particles.particleBirthRate / 4.0
            particles.particleLifetime = particles.particleLifetime * 4.0
            
            particles.particleSpeed = 180
            particles.particleSpeedRange = backgroundStopSpeed / 4
        }
    }
    
    // In 'gameOver()' we are just setting the color to gray. We'll use methods like this in our subclasses that can be called on each when the game is over to perform some behavior. Later on we'll be making the game gray-scale momentarily when the player is out of lives and has lost the game as a visual cue that the game is over before showing the score.
    func gameOver() {
        for particles in particlesArray {
            particles.particleColor = SKColor.gray
        }
    }
    
}
*/

import SpriteKit

class Background: SKNode {
    
    // MARK: - Private class constants
    // Here we create two constants for speed
    private let backgroundRunSpeed:CGFloat = 200.0
    private let backgroundStopSpeed:CGFloat = 50.0
    
    // MARK: - Private class variables
    // Here we create three instances of SKEmitterNode and we create an array to store our three particle emitters so we can loop over them to change the speed, color ect.
    private var particlesLarge = SKEmitterNode()
    private var particlesMedium = SKEmitterNode()
    private var particlesSmall = SKEmitterNode()
    private var particlesArray = [SKEmitterNode]()
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.setup()
    }
    
    // MARK: - Setup
    private func setup() {
        
        self.zPosition = -10.0  // Setting the zPosition of this node to -1.0. If you dont specify a zPosition it is given the same zPosition as its parent. A scene has a zPosition of 0, and any children added to it will share this zPosition. By setting the zPosition of Backgroud to -1.0, we are explicitly placing it behind other objects added to the scene. If we didn't do this, the particles would sometimes overlab other sprites which isn't much of a background effect.
        
        // Here we initialize each of the particle emitters using our 'GameParticles' singleton to get a copy of the 'backgroundEmitter'
        // particlesLarge = GameParticles.sharedInstance.createParticles(particles: .background)
        particlesMedium = GameParticles.sharedInstance.createParticles(particles: .background)
        particlesSmall = GameParticles.sharedInstance.createParticles(particles: .background)
        
        // Here we set the scale of each emitter so they come in at different sizes to make it look more interesting
        particlesLarge.particleScale = 1.0
        particlesMedium.particleScale = 0.5
        particlesSmall.particleScale = 0.25
        
        //Each particle emitter is added to the 'particlesArray' array. Then we have a for loop which loops over members in the array and adds them as a child of Background.
        // particlesArray.append(particlesLarge)
        particlesArray.append(particlesMedium)
        particlesArray.append(particlesSmall)
        
        for particles in particlesArray {
            self.addChild(particles)
        }
        
        // We want the particles to be in their idle state at first, so before leaving setup() we call the stopBackround() method defined below
        stopBackground()
    }
    
    // MARK: - Actions
    
    // In 'startBackground()' and 'stopBackground()' we control the speed the particles are moving, and the range. The range is how much variation there can be. So if the 'particleSpeed' is 100.0 and the 'particleSpeedRange' is 25.0, the 'particeSpeed' can be between 125.0 and 75.0. It is more interesting than each particle moving at exactly the same speed.
    
    func startBackground() {
        for particles in particlesArray {
            particles.particleBirthRate = particles.particleBirthRate * 4.0
            particles.particleLifetime = particles.particleLifetime / 4.0
            
            particles.particleSpeed = 180
            particles.particleSpeedRange = backgroundRunSpeed / 4
        }
    }
    
    func stopBackground() {
        for particles in particlesArray {
            particles.particleBirthRate = particles.particleBirthRate / 4.0
            particles.particleLifetime = particles.particleLifetime * 4.0
            
            particles.particleSpeed = 180
            particles.particleSpeedRange = backgroundStopSpeed / 4
        }
    }
    
    // In 'gameOver()' we are just setting the color to gray. We'll use methods like this in our subclasses that can be called on each when the game is over to perform some behavior. Later on we'll be making the game gray-scale momentarily when the player is out of lives and has lost the game as a visual cue that the game is over before showing the score.
    func gameOver() {
        for particles in particlesArray {
            particles.particleColor = SKColor.gray
        }
    }
    
}
