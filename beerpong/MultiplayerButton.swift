//
//  MultiplayerButton.swift
//  SpaceRunner
//
//  Created by Steven on 10/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation
import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class MultiplayerButton: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.multiplayerButton)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
            self.position = CGPoint(x: kViewSize.width * 0.5, y: kViewSize.height * 0.25)
    }
    
}
