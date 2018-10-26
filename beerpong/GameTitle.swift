//===================================================
//===================================================
//               ~ GameTitle.swift ~
//                     ~ beerpong ~
//===================================================
//===================================================
//        Created by Steven Frank on 10/3/16.
//Copyright © 2016 Steven Frank. All rights reserved.
//===================================================
//===================================================


import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class GameTitle: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.title)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.setScale(0)
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.8) // Positions to be in the center of the screen horiz. and 70% up the screen from bottom.
        self.zPosition = 1
    }
    
}
