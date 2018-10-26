//
//  Level1CupTop.swift
//  beerpong
//
//  Created by Steven on 11/14/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import SpriteKit

class Level1CupTop: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.cupMainTop)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.3)
        self.zPosition = 9
        self.setScale(1/6)
    }
}
