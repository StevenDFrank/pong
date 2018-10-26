//
//  GameOverBox.swift
//  beerpong
//
//  Created by Steven on 11/18/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation
import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class GameOverBox: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.gameOverBox)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.setScale(1/2)
        self.zPosition = 2
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.7)
    }
    
}
