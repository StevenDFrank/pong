//
//  GameParticles.swift
//  beerpong
//
//  Created by Steven on 10/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import SpriteKit

class GameParticles2 {
    
    static let sharedInstance = GameParticles2()  // Decalare the static constant 'sharedInstance' which is the magic line that makes this class a Singleton when accessed through this constraint
    
    // MARK: Class Enum
    enum Particles:Int {
        case background, engine
    }
    
    // MARK: - Private class variables
    private var backgroundEmitter = SKEmitterNode()  // private variables of type SKEmitterNode. Empty but become initialized further down in the two setup methods
    private var engineEmitter = SKEmitterNode()
    
    init() { // We call two setup methods; one for each type of 'SKEmitterNode' this class provides
        setupBackgroundEmitter()
        setupEngineEmitter()
    }
    
    private func setupBackgroundEmitter() {
        
        // Birthrate and Lifetime
        backgroundEmitter.particleBirthRate = 1.0
        backgroundEmitter.particleLifetime = 10.0
        backgroundEmitter.particleLifetimeRange = 5.0
        
        // Position Range
        backgroundEmitter.position = CGPoint(x: kViewSize.width / 2, y: 0)
        backgroundEmitter.particlePositionRange = CGVector(dx: kViewSize.width, dy: 0)
        
        // Speed
        backgroundEmitter.particleSpeed = 200.0
        backgroundEmitter.particleSpeedRange = backgroundEmitter.particleSpeed / 4
        
        // Emission Angle
        backgroundEmitter.emissionAngle = DegreesToRadians(degrees: 90.0)
        backgroundEmitter.emissionAngleRange = DegreesToRadians(degrees: 15)
        
        // Alpha
        backgroundEmitter.particleAlpha = 1
        backgroundEmitter.particleAlphaRange = 0.1
        //backgroundEmitter.particleAlphaSpeed = -0.125
        
        // Color blending
        // backgroundEmitter.particleColorBlendFactor = 0.5
        // backgroundEmitter.particleColorBlendFactorRange = 0.25
        
        // Color
        // backgroundEmitter.particleColor = Colors.colorFromRGB(rgbvalue: Colors.dust)
        
        // Texture
        backgroundEmitter.particleTexture = GameTextures.sharedInstance.texture(name: SpriteName.magic)
    }
    
    private func setupEngineEmitter() {
        
        // Birthrate and Lifetime
        engineEmitter.particleBirthRate = 1.0
        engineEmitter.particleLifetime = 0.5
        
        // Position Range
        engineEmitter.particlePositionRange = CGVector(dx: 0, dy: 0)
        
        // Angle
        engineEmitter.emissionAngle = DegreesToRadians(degrees: 90)
        
        // Speed
        engineEmitter.particleSpeed = -80.0
        
        // Color Blending
        engineEmitter.particleColorBlendFactor = 1.0
        
        // Color
        engineEmitter.particleColor = Colors.colorFromRGB(rgbvalue: Colors.engine)
        
        // Texture
        engineEmitter.particleTexture = GameTextures.sharedInstance.texture(name: SpriteName.magic)
        
    }
    
    // MARK: - Public methods
    func createParticles(particles: Particles) -> SKEmitterNode {
        switch particles {
        case .background:
            return backgroundEmitter.copy() as! SKEmitterNode
            
        case .engine:
            return engineEmitter.copy() as! SKEmitterNode
        }
    }
}

class GameParticles3 {
    
    static let sharedInstance = GameParticles3()  // Decalare the static constant 'sharedInstance' which is the magic line that makes this class a Singleton when accessed through this constraint
    
    // MARK: Class Enum
    enum Particles:Int {
        case background, engine
    }
    
    // MARK: - Private class variables
    private var backgroundEmitter = SKEmitterNode()  // private variables of type SKEmitterNode. Empty but become initialized further down in the two setup methods
    private var engineEmitter = SKEmitterNode()
    
    init() { // We call two setup methods; one for each type of 'SKEmitterNode' this class provides
        setupBackgroundEmitter()
        setupEngineEmitter()
    }
    
    private func setupBackgroundEmitter() {
        
        // Birthrate and Lifetime
        backgroundEmitter.particleBirthRate = 0.5
        backgroundEmitter.particleLifetime = 10.0
        backgroundEmitter.particleLifetimeRange = 10.0
        
        // Position Range
        backgroundEmitter.position = CGPoint(x: kViewSize.width / 2, y: 0)
        backgroundEmitter.particlePositionRange = CGVector(dx: kViewSize.width, dy: kViewSize.height)
        
        // Speed
        backgroundEmitter.particleSpeed = 300.0
        backgroundEmitter.particleSpeedRange = backgroundEmitter.particleSpeed / 4
        
        // Emission Angle
        backgroundEmitter.emissionAngle = DegreesToRadians(degrees: 90.0)
        backgroundEmitter.emissionAngleRange = DegreesToRadians(degrees: 4)
        
        // Alpha
        backgroundEmitter.particleAlpha = 0.9
        backgroundEmitter.particleAlphaRange = 0.1
        backgroundEmitter.particleAlphaSpeed = -0.125
        
        // Color blending
        // backgroundEmitter.particleColorBlendFactor = 0.5
        // backgroundEmitter.particleColorBlendFactorRange = 0.25
        
        // Color
        // backgroundEmitter.particleColor = Colors.colorFromRGB(rgbvalue: Colors.dust)
        
        // Texture
        backgroundEmitter.particleTexture = GameTextures.sharedInstance.texture(name: SpriteName.magic)
    }
    
    private func setupEngineEmitter() {
        
        // Birthrate and Lifetime
        engineEmitter.particleBirthRate = 2.0
        engineEmitter.particleLifetime = 0.5
        
        // Position Range
        engineEmitter.particlePositionRange = CGVector(dx: 0, dy: 0)
        
        // Angle
        engineEmitter.emissionAngle = DegreesToRadians(degrees: 90)
        
        // Speed
        engineEmitter.particleSpeed = -80.0
        
        // Color Blending
        engineEmitter.particleColorBlendFactor = 1.0
        
        // Color
        engineEmitter.particleColor = Colors.colorFromRGB(rgbvalue: Colors.engine)
        
        // Texture
        engineEmitter.particleTexture = GameTextures.sharedInstance.texture(name: SpriteName.magic)
        
    }
    
    // MARK: - Public methods
    func createParticles(particles: Particles) -> SKEmitterNode {
        switch particles {
        case .background:
            return backgroundEmitter.copy() as! SKEmitterNode
            
        case .engine:
            return engineEmitter.copy() as! SKEmitterNode
        }
    }
}


