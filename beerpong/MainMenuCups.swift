//
//  MainMenuCups.swift
//  beerpong
//
//  Created by Steven on 11/1/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class CupLeft: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.cupLeft)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.position = CGPoint(x: kViewSize.width * 0.30, y: kViewSize.height * 0.46)
        self.setScale(0)
        self.zPosition = 0
    }
    
}

class CupRight: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.cupRight)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.position = CGPoint(x: kViewSize.width * 0.70, y: kViewSize.height * 0.46)
        self.zPosition = 0
        self.setScale(0)
    }
}

class CupMain: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.cupMain)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.40)
        self.zPosition = 1
        self.setScale(0)
    }
}

class CupMainTop: SKSpriteNode {
    
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
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.40)
        self.zPosition = 9
        self.setScale(0)
    }
}

