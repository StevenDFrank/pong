//
//  ChooseGameLevelScene.swift
//  beerpong
//
//  Created by Steven on 10/26/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import SpriteKit
import AVFoundation

class ChooseGameLevelScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Private instance variables
    private var AfterTouch = Bool()
    var startPoint: CGPoint?
    var touchTime = NSDate()
    var direction = CGVector()
    private var One = SKSpriteNode()
    private var Two = SKSpriteNode()
    private var Three = SKSpriteNode()
    private var Four = SKSpriteNode()
    private var Five = SKSpriteNode()
    private var Six = SKSpriteNode()
    private var Level = SKSpriteNode()
    //MARK: - Private instance constants
    
    private let foreground = Foreground()
    private let background = Background()
    private let background2 = Background2()
    private let Cup1 = Cup()
    private let Cup2 = CupGreyscale()
    private let Cup3 = CupGreyscale()
    private let Cup4 = CupGreyscale()
    private let Cup5 = CupGreyscale()
    private let Cup6 = CupGreyscale()
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        self.setup()
    }
    
    //Delay Function
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)}

    
    // MARK: - Setup
    private func setup() {
        AfterTouch = false
        self.physicsWorld.contactDelegate = self
        
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.background)
        self.addChild(foreground)
        self.addChild(background)
        self.addChild(background2)
        
        Level = SKSpriteNode(imageNamed: "level")
        Level.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.8)
        Level.zPosition = 15
        Level.setScale(1)
        self.addChild(Level)
        
        Cup1.zPosition = 12
        self.addChild(Cup1)
        Cup2.zPosition = 10
        self.addChild(Cup2)
        Cup3.zPosition = 8
        self.addChild(Cup3)
        Cup4.zPosition = 6
        self.addChild(Cup4)
        Cup5.zPosition = 4
        self.addChild(Cup5)
        Cup6.zPosition = 2
        self.addChild(Cup6)
        
        One = SKSpriteNode(imageNamed: "one")
        One.position = Cup1.position
        One.zPosition = 13
        One.setScale(0.5)
        self.addChild(One)
        
        Two = SKSpriteNode(imageNamed: "two")
        Two.position = Cup2.position
        Two.zPosition = 11
        Two.setScale(0.5)
        self.addChild(Two)
        
        Three = SKSpriteNode(imageNamed: "three")
        Three.position = Cup3.position
        Three.zPosition = 9
        Three.setScale(0.5)
        self.addChild(Three)
        
        Four = SKSpriteNode(imageNamed: "four")
        Four.position = Cup4.position
        Four.zPosition = 7
        Four.setScale(0.5)
        self.addChild(Four)
        
        Five = SKSpriteNode(imageNamed: "five")
        Five.position = Cup5.position
        Five.zPosition = 5
        Five.setScale(0.5)
        self.addChild(Five)
        
        Six = SKSpriteNode(imageNamed: "six")
        Six.position = Cup6.position
        Six.zPosition = 3
        Six.setScale(0.5)
        self.addChild(Six)
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        let action = SKAction.move(to: Cup1.position, duration: 0)
        One.run(action)
        let action1 = SKAction.move(to: Cup2.position, duration: 0)
        Two.run(action1)
        let action2 = SKAction.move(to: Cup3.position, duration: 0)
        Three.run(action2)
        let action3 = SKAction.move(to: Cup4.position, duration: 0)
        Four.run(action3)
        let action4 = SKAction.move(to: Cup5.position, duration: 0)
        Five.run(action4)
        let action5 = SKAction.move(to: Cup6.position, duration: 0)
        Six.run(action5)
    }
    
    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        startPoint = touch.location(in: view)
        touchTime = NSDate()
        if self.contains(touchLocation) && AfterTouch == false{
            playSound1()
            delay(0.1){self.Cup2.run(SKAction.move(by: CGVector(dx: -45, dy: 60), duration: 0.5))}
            delay(0.2){self.Cup3.run(SKAction.move(by: CGVector(dx: 45, dy: 60), duration: 0.5))
                self.AfterTouch = true}
            delay(0.3){self.Cup4.run(SKAction.move(by: CGVector(dx: -90, dy: 120), duration: 0.5))}
            delay(0.4){self.Cup5.run(SKAction.move(by: CGVector(dx: 0, dy: 120), duration: 0.5))}
            delay(0.5){self.Cup6.run(SKAction.move(by: CGVector(dx: 90, dy: 120), duration: 0.5))}
            delay(1.0){
                self.Cup1.run(SKAction.scale(to: 0.2, duration:1))
                self.Cup2.run(SKAction.scale(to: 0.2, duration:1))
                self.Cup3.run(SKAction.scale(to: 0.2, duration:1))
                self.Cup4.run(SKAction.scale(to: 0.2, duration:1))
                self.Cup5.run(SKAction.scale(to: 0.2, duration:1))
                self.Cup6.run(SKAction.scale(to: 0.2, duration:1))
                self.One.run(SKAction.scale(to: 0.8, duration: 2))
                self.Two.run(SKAction.scale(to: 0.8, duration: 2))
                self.Three.run(SKAction.scale(to: 0.8, duration: 2))
                self.Four.run(SKAction.scale(to: 0.8, duration: 2))
                self.Five.run(SKAction.scale(to: 0.8, duration: 2))
                self.Six.run(SKAction.scale(to: 0.8, duration: 2))
            }
        }
        if AfterTouch == true && Cup1.contains(touchLocation){
            loadScene2()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        defer {
            startPoint = nil
        }
        guard touches.count == 1, let startPoint = startPoint else {
            return
        }
        if let touch = touches.first {
            let endPoint = touch.location(in: view)
            //Calculate your vector from the delta and what not here
            direction = CGVector(dx: endPoint.x - startPoint.x, dy: endPoint.y - startPoint.y)
            let elapsedTime = touchTime.timeIntervalSinceNow
            let angle = atan2f(Float(direction.dy), Float(direction.dx))
            
            print()
            print(direction)
            print(elapsedTime)
            print(angle)
        }
        if direction.dx > 50 {
            playSound1()
            loadScene()
        }
    }
    // MARK: - Load Scene
    private func loadScene() {
        let scene = ChooseLevelScene(size: kViewSize)
        let transition = SKTransition.push(with: SKTransitionDirection.right, duration: 0.3)
        self.view?.presentScene(scene, transition: transition)
    }
    
    private func loadScene2() {
        let scene = LOneScene(size: kViewSize)
        let transition = SKTransition.crossFade(withDuration: 0.3)
        self.view?.presentScene(scene, transition: transition)
    }
}
