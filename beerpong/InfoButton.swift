//
//  InfoButton.BeerPongGame
//  beerpong
//
//  Created by Steven on 10/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//


import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class InfoButton: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.infoButton)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.setScale(1)
        self.position = CGPoint(x: kViewSize.width * 0.10, y: kViewSize.height * 0.95)
    }
    
}

class AboutInfo: SKSpriteNode{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.aboutInfo)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        
         self.setScale(0)
        self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.5)
    }
    
}
