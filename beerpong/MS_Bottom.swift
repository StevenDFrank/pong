//
//  MS_Bottom.swift
//  beerpong
//
//  Created by Steven on 11/1/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class MS_Bottom: SKSpriteNode {
    
    let ScalePBup = SKAction.scaleX(to: 0.8, y: 0.8, duration: 1)
    let ScalePBdown = SKAction.scaleX(to: 1, y: 1, duration: 1)
    
    func startPulse() {
        run(SKAction.repeatForever(SKAction.sequence([ScalePBup,ScalePBdown])))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.gameOverTitle)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.setScale(1)
        self.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height/2 - 130)
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = PhysicsCategory.Bottom
        self.physicsBody?.collisionBitMask = PhysicsCategory.Ball
        self.physicsBody?.contactTestBitMask  = PhysicsCategory.Ball
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.zPosition = -50
        self.isHidden = true
        self.addChild(self)
    }
    
}
