//===================================================
//===================================================
//               ~ PlayButton.swift ~
//                   ~ beerpong ~
//===================================================
//===================================================
//        Created by Steven Frank on 10/3/16.
//Copyright © 2016 Steven Frank. All rights reserved.
//===================================================
//===================================================


import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class PlayButton: SKSpriteNode {
    
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
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.playButton)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.15)
        self.setScale(0)
    }
    
}
