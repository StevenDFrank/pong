//===================================================
//===================================================
//               ~ GameTextures.Swift ~
//                 ~ beerpong ~
//===================================================
//===================================================
//        Created by Steven Frank on 10/3/16.
//Copyright © 2016 Steven Frank. All rights reserved.
//===================================================
//===================================================


import Foundation
import SpriteKit

class GameTextures {
    
    static let sharedInstance = GameTextures() // First create constant called sharedInstance that is a reference to the class itself. This is the 'magic' line that makes this a Singleton. Any time we access the class as GameTextures.sharedInstance we are talking to the singleton.
    
    // MARK: - Private class constants
    private let gameSprites = "GameSprites" // Create constants that hold the names of SpriteAtlases to avoid mistyping. Optional but recommended step.
    private let interfaceSprites = "InterfaceSprites"
    
    // MARK: - Private class variables
    private var interfaceSpritesAtlas = SKTextureAtlas()  // Two private variables that are instantiated as empty SKTextureAtlases
    private var gameSpritesAtlas = SKTextureAtlas()
    
    // MARK: - Init
    init() {  // The 'init()' method is where the class does any basic initialization it needs to do. In this case we are populating the two texture atlases with the contents of our SpriteAtlases.
        self.interfaceSpritesAtlas = SKTextureAtlas(named: gameSprites)  // reference with keyword 'self'. This is required inside an init method, but optional in Swift outside of init in our other methods. Some people prefer to always refer to an instance variable with self.variable. Usually chose to omit it when not required to keep code a bit more simple.
        self.gameSpritesAtlas = SKTextureAtlas(named: interfaceSprites)
    }
    
    // MARK: - Public convenience methods
    // The following two methods take a name of a sprite as a string and return either an SKSpriteNode of that name or an SKTexture of that name respectively.
    
    func texture(name: String) -> SKTexture {
        return SKTexture(imageNamed: name)
    }
    
    func sprite(name: String) -> SKSpriteNode {
        return SKSpriteNode(imageNamed: name)
    }
}
