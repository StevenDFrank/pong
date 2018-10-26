//
//  SingleplayerButton.swift
//  SpaceRunner
//
//  Created by Steven on 10/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation
//
//  MultiplayerButton.swift
//  SpaceRunner
//
//  Created by Steven on 10/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation
import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class SingleplayerButton: SKSpriteNode {
    
    /*let ScalePBup = SKAction.scaleX(to: 1.2, y: 1.2, duration: 1)
     let ScalePBdown = SKAction.scaleX(to: 1, y: 1, duration: 1)
     
     func startPulse() {
     run(SKAction.repeatForever(SKAction.sequence([ScalePBup,ScalePBdown])))
     }*/
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color:UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.singleplayerButton)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.position = CGPoint(x: kViewSize.width * 0.5, y: kViewSize.height * 0.70)
    }
    
}
