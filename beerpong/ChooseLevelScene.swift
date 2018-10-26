//
//  ChooseLevelScene.swift
//  beerpong
//
//  Created by Steven on 10/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import SpriteKit
import AVFoundation

struct PhysicsCategory {
    static let Ball : UInt32 = 0x1 << 7
    static let Bottom : UInt32 = 0x1 << 8
    static let Ball2 : UInt32 = 0x1 << 9
    static let Bottom2 : UInt32 = 0x1 << 10
    static let Activator : UInt32 = 0x1 << 11
    static let BottomSpawner : UInt32 = 0x1 << 12
    static let L1Ball : UInt32 = 0x1 << 13
    static let L1ActivatorT1 : UInt32 = 0x1 << 14
    static let L1ActivatorT2 : UInt32 = 0x1 << 15
    static let L1ActivatorT3 : UInt32 = 0x1 << 16
    static let L1ActivatorT4 : UInt32 = 0x1 << 17
    static let Cup1Bottom : UInt32 = 0x1 << 18
    static let Cup2Bottom : UInt32 = 0x1 << 19
    static let Cup3Bottom : UInt32 = 0x1 << 20
    static let Cup4Bottom : UInt32 = 0x1 << 21
    static let Cup5Bottom : UInt32 = 0x1 << 22
    static let Cup6Bottom : UInt32 = 0x1 << 23
    static let L1Boundaries: UInt32 = 0x1 << 24
}

class ChooseLevelScene: SKScene, SKPhysicsContactDelegate {

    // MARK: - Private instance variables
    private var sceneLabel:SKLabelNode?
    private var Ball = SKSpriteNode()
    private var Bottom = SKSpriteNode()
    private var Ball2 = SKSpriteNode()
    private var Bottom2 = SKSpriteNode()
    private var BallContact = SKPhysicsContact()
    private var SoloTop = SKSpriteNode()
    private var VersusTop = SKSpriteNode()
    private var AfterTouch = Bool()
    private var AfterTouch2 = Bool()
    private var startPoint: CGPoint?
    private var touchTime = NSDate()
    private var direction = CGVector()
    private var BarUp = Bool()
    private var MusicCheck = Bool()
    private var One = SKSpriteNode()
    private var Two = SKSpriteNode()
    private var Three = SKSpriteNode()
    private var Four = SKSpriteNode()
    private var Five = SKSpriteNode()
    private var Six = SKSpriteNode()
    private var Level = SKSpriteNode()
    
    //MARK: - Private instance constants
    private let optionsBar = OptionsBar()
    private let musicOn = MusicOn()
    private let musicOut = MusicOut()
    private let soundsOn = SoundsOn()
    private let soundsOff = SoundsOff()
    private let starInfo = Star()
    private let singleplayerButton = SingleplayerButton()
    private let multiplayerButton = MultiplayerButton()
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
    
    private func scenetransitionIn1(){
        let scaleUpthenDown = SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.4),SKAction.scale(to: 1, duration: 0.1)])
        
        delay(0.2){self.singleplayerButton.run(scaleUpthenDown)
            self.SoloTop.run(scaleUpthenDown)}
        delay(0.3){self.multiplayerButton.run(scaleUpthenDown)
            self.VersusTop.run(scaleUpthenDown)}
        delay(0.8){self.optionsBar.run(SKAction.move(by: CGVector(dx: 0, dy: -self.optionsBar.frame.height/6), duration:0.5))}
    }
    
    private func scenetransitionOut1(){
        let transitionOut = SKAction.sequence([SKAction.scale(to: 1.1, duration:0.1),SKAction.scale(to: 0, duration:0.4)])

        self.multiplayerButton.run(transitionOut)
        self.VersusTop.run(transitionOut)
        delay(0.2){self.singleplayerButton.run(transitionOut)
            self.SoloTop.run(transitionOut)}
    }

    private func scenetransitionIn2(){
        let scaleUpthenDown = SKAction.sequence([SKAction.scale(to: 0.6, duration: 0.4),SKAction.scale(to: 0.5, duration: 0.1)])
        let scaleUpthenDown1 = SKAction.sequence([SKAction.scale(to: 0.17, duration: 0.4),SKAction.scale(to: 0.14, duration: 0.1)])
        let scaleUpthenDown2 = SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.4),SKAction.scale(to: 1, duration: 0.1)])
        
        Level.run(scaleUpthenDown2)
        Cup1.run(scaleUpthenDown1)
        Cup2.run(scaleUpthenDown1)
        Cup3.run(scaleUpthenDown1)
        Cup4.run(scaleUpthenDown1)
        Cup5.run(scaleUpthenDown1)
        Cup6.run(scaleUpthenDown1)
        One.run(scaleUpthenDown)
        Two.run(scaleUpthenDown)
        Three.run(scaleUpthenDown)
        Four.run(scaleUpthenDown)
        Five.run(scaleUpthenDown)
        Six.run(scaleUpthenDown)
        
    }

    // MARK: - Setup
    private func setup() {
        AfterTouch = false
        AfterTouch2 = false
        BarUp = true
        self.physicsWorld.contactDelegate = self
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.background)
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.background)
        singleplayerButton.setScale(0)
        self.addChild(singleplayerButton)
        multiplayerButton.setScale(0)
        self.addChild(multiplayerButton)
        self.addChild(foreground)
        self.addChild(background)
        self.addChild(background2)
        self.addChild(musicOn)
        self.addChild(musicOut)
        self.addChild(soundsOn)
        // self.addChild(soundsOff)
        self.addChild(optionsBar)
        self.addChild(starInfo)
        
        Level = SKSpriteNode(imageNamed: "level")
        Level.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.8)
        Level.zPosition = 15
        Level.setScale(0)
        self.addChild(Level)
        
        Cup1.zPosition = 12
        Cup1.setScale(0)
        self.addChild(Cup1)
        Cup2.zPosition = 10
        Cup2.setScale(0)
        self.addChild(Cup2)
        Cup3.zPosition = 8
        Cup3.setScale(0)
        self.addChild(Cup3)
        Cup4.zPosition = 6
        Cup4.setScale(0)
        self.addChild(Cup4)
        Cup5.zPosition = 4
        Cup5.setScale(0)
        self.addChild(Cup5)
        Cup6.zPosition = 2
        Cup6.setScale(0)
        self.addChild(Cup6)
        
        One = SKSpriteNode(imageNamed: "one")
        One.position = Cup1.position
        One.zPosition = 13
        One.setScale(0)
        self.addChild(One)
        
        Two = SKSpriteNode(imageNamed: "two")
        Two.position = Cup2.position
        Two.zPosition = 11
        Two.setScale(0)
        self.addChild(Two)
        
        Three = SKSpriteNode(imageNamed: "three")
        Three.position = Cup3.position
        Three.zPosition = 9
        Three.setScale(0)
        self.addChild(Three)
        
        Four = SKSpriteNode(imageNamed: "four")
        Four.position = Cup4.position
        Four.zPosition = 7
        Four.setScale(0)
        self.addChild(Four)
        
        Five = SKSpriteNode(imageNamed: "five")
        Five.position = Cup5.position
        Five.zPosition = 5
        Five.setScale(0)
        self.addChild(Five)
        
        Six = SKSpriteNode(imageNamed: "six")
        Six.position = Cup6.position
        Six.zPosition = 3
        Six.setScale(0)
        self.addChild(Six)

        SoloTop = SKSpriteNode(imageNamed: "solotop")
        SoloTop.position = CGPoint (x: kViewSize.width * 0.5, y: kViewSize.height * 0.70)
        SoloTop.zPosition = 3
        SoloTop.setScale(0)
        self.addChild(SoloTop)
    
        VersusTop = SKSpriteNode(imageNamed: "multiplayerbuttontop")
        VersusTop.position = CGPoint (x: kViewSize.width * 0.5, y: kViewSize.height * 0.25)
        VersusTop.zPosition = 5
        VersusTop.setScale(0)
        self.addChild(VersusTop)
        
        Ball = SKSpriteNode(imageNamed: "pongball")
        Ball.setScale(1)
        Ball.position = CGPoint(x: self.frame.width + Ball.frame.width, y: self.frame.height * 0.6)
        Ball.physicsBody = SKPhysicsBody(circleOfRadius: Ball.frame.height / 2)
        Ball.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        Ball.physicsBody?.collisionBitMask = PhysicsCategory.Bottom
        Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Bottom
        Ball.physicsBody?.affectedByGravity = false
        Ball.physicsBody?.isDynamic = true
        Ball.zPosition = 2
        self.addChild(Ball)
        
        Bottom = SKSpriteNode(imageNamed: "GameOverTitle")
        Bottom.setScale(1)
        Bottom.position = CGPoint(x: kViewSize.width * 0.6, y: kViewSize.height * 0.50 + 15)
        Bottom.physicsBody = SKPhysicsBody(rectangleOf: Bottom.size)
        Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Bottom
        Bottom.physicsBody?.collisionBitMask = PhysicsCategory.Ball
        Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.Ball
        Bottom.physicsBody?.affectedByGravity = false
        Bottom.physicsBody?.isDynamic = false
        Bottom.zPosition = -50
        Bottom.isHidden = true
        self.addChild(Bottom)
        
        Ball2 = SKSpriteNode(imageNamed: "pongball")
        Ball2.setScale(1)
        Ball2.position = CGPoint(x: self.frame.width + Ball2.frame.width, y: self.frame.height * 0.1)
        Ball2.physicsBody = SKPhysicsBody(circleOfRadius: Ball2.frame.height / 2)
        Ball2.physicsBody?.categoryBitMask = PhysicsCategory.Ball2
        Ball2.physicsBody?.collisionBitMask = PhysicsCategory.Bottom2
        Ball2.physicsBody?.contactTestBitMask  = PhysicsCategory.Bottom2
        Ball2.physicsBody?.affectedByGravity = false
        Ball2.physicsBody?.isDynamic = true
        Ball2.zPosition = 4
        self.addChild(Ball2)
        
        Bottom2 = SKSpriteNode(imageNamed: "GameOverTitle")
        Bottom2.setScale(1)
        Bottom2.position = CGPoint(x: kViewSize.width * 0.6, y: kViewSize.height * 0.07)
        Bottom2.physicsBody = SKPhysicsBody(rectangleOf: Bottom2.size)
        Bottom2.physicsBody?.categoryBitMask = PhysicsCategory.Bottom2
        Bottom2.physicsBody?.collisionBitMask = PhysicsCategory.Ball2
        Bottom2.physicsBody?.contactTestBitMask  = PhysicsCategory.Ball2
        Bottom2.physicsBody?.affectedByGravity = false
        Bottom2.physicsBody?.isDynamic = false
        Bottom2.zPosition = -50
        Bottom2.isHidden = true
        self.addChild(Bottom2)
        
        scenetransitionIn1()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        if (firstBody.categoryBitMask == PhysicsCategory.Ball && secondBody.categoryBitMask == PhysicsCategory.Bottom || firstBody.categoryBitMask == PhysicsCategory.Bottom && secondBody.categoryBitMask == PhysicsCategory.Ball) {
            Ball.physicsBody?.isDynamic = false
            Ball.isHidden = true
            playSound()
            scenetransitionOut1()
            delay(1){self.scenetransitionIn2()
                self.spreadLevels()}
        }
        if (firstBody.categoryBitMask == PhysicsCategory.Ball2 && secondBody.categoryBitMask == PhysicsCategory.Bottom2 || firstBody.categoryBitMask == PhysicsCategory.Bottom2 && secondBody.categoryBitMask == PhysicsCategory.Ball2) {
            Ball2.physicsBody?.isDynamic = false
            Ball2.isHidden = true
            playSound()
            scenetransitionOut1()
            delay(1){self.loadScene2()}
        }
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        // Positioning Icons on OptionsBar
        musicOn.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.3, y: optionsBar.position.y + 20), duration: 0))
        musicOut.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.3, y: optionsBar.position.y + 20), duration: 0))
        soundsOn.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.7, y: optionsBar.position.y + 20), duration: 0))
        soundsOff.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.7, y: optionsBar.position.y + 20), duration: 0))
        starInfo.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.16, y: optionsBar.position.y - optionsBar.frame.height * 0.4), duration: 0))
        One.run(SKAction.move(to: Cup1.position, duration: 0))
        Two.run(SKAction.move(to: Cup2.position, duration: 0))
        Three.run(SKAction.move(to: Cup3.position, duration: 0))
        Four.run(SKAction.move(to: Cup4.position, duration: 0))
        Five.run(SKAction.move(to: Cup5.position, duration: 0))
        Six.run(SKAction.move(to: Cup6.position, duration: 0))
        if player2?.isPlaying == true{
            MusicCheck = true
        }
        if player2?.isPlaying == false{
            MusicCheck = false
        }
    }
    
    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        startPoint = touch.location(in: view)
        touchTime = NSDate()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        defer {
            startPoint = nil
        }
        guard touches.count == 1, let startPoint = startPoint else {
            return
        }
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        if let touch = touches.first {
            let endPoint = touch.location(in: view)
            //Calculate your vector from the delta and what not here
            direction = CGVector(dx: endPoint.x - startPoint.x, dy: endPoint.y - startPoint.y)
            // let elapsedTime = touchTime.timeIntervalSinceNow
            // let angle = atan2f(Float(direction.dy), Float(direction.dx))
        }
        if singleplayerButton.contains(touchLocation){
            if (AfterTouch == false){
                if BarUp == true{
                    playSound1()
                    Ball.physicsBody?.affectedByGravity = true
                    Ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                    Ball.physicsBody?.applyImpulse(CGVector(dx: -6.5, dy: 30))
                    AfterTouch = true}
                }
            else {}
        }
        if multiplayerButton.contains(touchLocation){
            playSound1()
            Ball2.physicsBody?.affectedByGravity = true
            Ball2.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            Ball2.physicsBody?.applyImpulse(CGVector(dx: -6.5, dy: 30))}
        if Cup1.contains(touchLocation){
            loadScene()
        }
        if starInfo.contains(touchLocation){
            playSound1()
            optionsBarPress()
        }
        if musicOut.contains(touchLocation){
            MusicPress()
        }
        if direction.dx > 50 {
            playSound1()
            if BarUp == false{
                optionsBarPress()
                delay(0.6){self.loadScene5()}
            }
            else{loadScene5()}
        }
        if direction.dx < -50 {
            playSound1()
            if BarUp == false{
                optionsBarPress()
                delay(0.6){self.loadScene4()}
            }
            else{loadScene4()}
        }
    }
    
    //MARK: - OptionsBarHandling
    func optionsBarPress(){
        if BarUp == true{
            BarUp = false
            self.optionsBar.run(SKAction.sequence([SKAction.move(by: CGVector(dx: 0, dy:20), duration: 0.2), SKAction.move(by: CGVector(dx: 0, dy:-optionsBar.frame.height+optionsBar.frame.height/6), duration: 0.4)]))
            optionsIcon()
        }
        else if BarUp == false{
            BarUp = true
            self.optionsBar.run(SKAction.sequence([SKAction.move(by: CGVector(dx: 0, dy:-20), duration: 0.2), SKAction.move(by: CGVector(dx: 0, dy:optionsBar.frame.height-optionsBar.frame.height/6), duration: 0.4)]))
        }
    }
    
    private func optionsIcon(){
        if player2?.isPlaying == false{
            musicOn.isHidden = true
            musicOut.isHidden = false
        }
        if player2?.isPlaying == true{
            musicOn.isHidden = false
            musicOut.isHidden = true
        }
    }
    
    private func MusicPress(){
        if MusicCheck == false{
            playSong()
            musicOut.isHidden = true
            musicOn.isHidden = false
        }
        if MusicCheck == true{
            MuteMusic()
            musicOut.isHidden = false
            musicOn.isHidden = true
        }
        
    }

    private func spreadLevels(){
        playSound1()
        delay(0.1){self.Cup2.run(SKAction.move(by: CGVector(dx: -45, dy: 100), duration: 0.5))}
        delay(0.2){self.Cup3.run(SKAction.move(by: CGVector(dx: 45, dy: 100), duration: 0.5))
            self.AfterTouch = true}
        delay(0.3){self.Cup4.run(SKAction.move(by: CGVector(dx: -90, dy: 200), duration: 0.5))}
        delay(0.4){self.Cup5.run(SKAction.move(by: CGVector(dx: 0, dy: 200), duration: 0.5))}
        delay(0.5){self.Cup6.run(SKAction.move(by: CGVector(dx: 90, dy: 200), duration: 0.5))}
        delay(1.0){
            self.Cup1.run(SKAction.scale(to: 0.2, duration:1))
            self.Cup2.run(SKAction.scale(to: 0.2, duration:1))
            self.Cup3.run(SKAction.scale(to: 0.2, duration:1))
            self.Cup4.run(SKAction.scale(to: 0.2, duration:1))
            self.Cup5.run(SKAction.scale(to: 0.2, duration:1))
            self.Cup6.run(SKAction.scale(to: 0.2, duration:1))
            self.One.run(SKAction.scale(to: 0.7, duration: 1))
            self.Two.run(SKAction.scale(to: 0.7, duration: 1))
            self.Three.run(SKAction.scale(to: 0.7, duration: 1))
            self.Four.run(SKAction.scale(to: 0.7, duration: 1))
            self.Five.run(SKAction.scale(to: 0.7, duration: 1))
            self.Six.run(SKAction.scale(to: 0.7, duration: 1))
        }
    }

    // MARK: - Load Scene2
    private func loadScene2(){
        let scene = MenuScene(size: kViewSize)
        let transition = SKTransition.crossFade(withDuration: 0.3)
        self.view?.presentScene(scene, transition: transition)
    }
    
    // MARK: - Load Scene
    private func loadScene() {
        let scene = LOneScene(size: kViewSize)
        let transition = SKTransition.crossFade(withDuration: 0.3)
        self.view?.presentScene(scene, transition: transition)
    }
    
    // MARK: - Load Scene5
    private func loadScene5(){
        let scene = MenuScene(size: kViewSize)
        let transition = SKTransition.push(with: SKTransitionDirection.right, duration: 0.3)
        self.view?.presentScene(scene, transition: transition)
    }
    
    // MARK: - Load Scene4
    private func loadScene4(){
        let scene = ChooseGameLevelScene(size: kViewSize)
        let transition = SKTransition.push(with: SKTransitionDirection.left, duration: 0.3)
        self.view?.presentScene(scene, transition: transition)
    }
}
