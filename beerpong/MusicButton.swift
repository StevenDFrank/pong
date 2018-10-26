//
//  MusicButton.swift
//  beerpong
//
//  Created by Steven on 10/30/16.
//  Copyright © 2016 Steven. All rights reserved.
//

/*
 class var music:String {return "music"}
 class var voice:String {return "voice"}
 class var button:String {return "button"}
 class var buttonBackColor:String {return "buttonbackcolor"}
 class var buttonBackGrey:String {return "buttonbackgrey"}
 */

import SpriteKit  //  Changed from UIKit. Set to UIKit by default.

class MusicOn: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.musicOn)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.setScale(0.4)
        self.zPosition = 26
    }
    
}

class MusicOut: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.musicOut)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        setup()
    }
    
    private func setup() {
        self.setScale(0.4)
        self.zPosition = 27
    }
    
}

class SoundsOn: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.soundsOn)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        setup()
    }
    
    private func setup() {
        self.setScale(0.4)
        self.zPosition = 26
    }
    
}

class SoundsOff: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = GameTextures.sharedInstance.texture(name: SpriteName.soundsOff)
        self.init(texture: texture, color: SKColor.white, size: texture.size())
        
        setup()
    }
    
    private func setup() {
        self.setScale(0.4)
        self.zPosition = 27
    }
    
}
