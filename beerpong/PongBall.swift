 //===================================================
 //===================================================
 //               ~ PlayButton.swift ~
 //                 ~ SpaceRunner ~
 //===================================================
 //===================================================
 //        Created by Steven Frank on 10/3/16.
 //Copyright © 2016 Steven Frank. All rights reserved.
 //===================================================
 //===================================================
 
 
 import SpriteKit  //  Changed from UIKit. Set to UIKit by default.
 
 class PongBall: SKSpriteNode {
    
    let ScalePBup = SKAction.scale(to: 1, duration: 0.7)
    let ScalePBdown = SKAction.scale(to: 0.7, duration: 0.7)
    
    func startPulse() {
        run(SKAction.sequence([ScalePBdown,ScalePBup]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.pongBall)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.setScale(1)
        self.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height + self.frame.height)
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.height / 2)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.zPosition = 9
    }
 }
