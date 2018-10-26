//
//  LOneScene.swift
//  beerpong
//
//  Created by Steven on 10/28/16.
//  Copyright © 2016 Steven. All rights reserved.
//


import SpriteKit
import AVFoundation
import UIKit

class LOneScene: SKScene, SKPhysicsContactDelegate{

    private var Cup1 = Level1Cup()
    private var Cup2 = Level1Cup()
    private var Cup3 = Level1Cup()
    private var Cup4 = Level1Cup()
    private var Cup5 = Level1Cup()
    private var Cup6 = Level1Cup()
    private var Cup1Top = Level1CupTop()
    private var Cup2Top = Level1CupTop()
    private var Cup3Top = Level1CupTop()
    private var Cup4Top = Level1CupTop()
    private var Cup5Top = Level1CupTop()
    private var Cup6Top = Level1CupTop()
    private var gameOverBox = GameOverBox()
    private var Cup1Made = Bool()
    private var Cup2Made = Bool()
    private var Cup3Made = Bool()
    private var Cup4Made = Bool()
    private var Cup5Made = Bool()
    private var Cup6Made = Bool()
    private var T1Hit = Bool()
    private var T2Hit = Bool()
    private var T3Hit = Bool()
    private var T4Hit = Bool()
    private var BallInAir = Bool()
    private var gameOver = false
    private var startPoint: CGPoint?
    private var startPoint1: CGPoint?
    private var touchTime = NSDate()
    private var direction = CGVector()
    private var L1Ball = SKSpriteNode()
    private var L1ActivatorT1 = SKSpriteNode()
    private var L1ActivatorT2 = SKSpriteNode()
    private var L1ActivatorT3 = SKSpriteNode()
    private var L1ActivatorT4 = SKSpriteNode()
    private var L1Boundaries = SKSpriteNode()
    private var Cup1Bottom = SKSpriteNode()
    private var Cup2Bottom = SKSpriteNode()
    private var Cup3Bottom = SKSpriteNode()
    private var Cup4Bottom = SKSpriteNode()
    private var Cup5Bottom = SKSpriteNode()
    private var Cup6Bottom = SKSpriteNode()
    private var x = CGFloat()
    private var y = CGFloat()
    private var BarUp = Bool()
    private var MusicCheck = Bool()
    private var CupTexture = SKTexture(imageNamed: "Level1Cup")
    private var TexturedCup1 = SKSpriteNode()
    private var TexturedCup2 = SKSpriteNode()
    private var TexturedCup3 = SKSpriteNode()
    private var TexturedCup4 = SKSpriteNode()
    private var TexturedCup5 = SKSpriteNode()
    private var TexturedCup6 = SKSpriteNode()
    private var score = 0
    private var shots = 0
    private var cameraNodePositioner = SKShapeNode()
    private var escape = SKSpriteNode()
    private var restart = SKSpriteNode()
    
    private var scoreLabel = SKLabelNode()
    private var shotsLabel = SKLabelNode()
    private var missedLabel = SKLabelNode()
    
    private var attempts = SKSpriteNode(imageNamed: "attempts")
    private var missed = SKSpriteNode(imageNamed: "missed")
    private var made = SKSpriteNode(imageNamed: "made")
 
    private let cameraNode = SKCameraNode()
    private let zoomInAction = SKAction.scale(to: 0.8, duration: 1)
    private let zoomOutAction = SKAction.scale(to: 1, duration: 1)
    private let zoomInAction2 = SKAction.scale(to: 0.4, duration: 1)
    private let zoomOutAction2 = SKAction.scale(to: 0.5, duration: 1)
    
    private let ballZoomInt = SKAction.sequence([SKAction.scale(to: 3, duration: 0.69),SKAction.scale(to:0.33, duration: 0.69)])
    private let optionsBar = OptionsBar()
    private let musicOn = MusicOn()
    private let musicOut = MusicOut()
    private let soundsOn = SoundsOn()
    private let soundsOff = SoundsOff()
    private let starInfo = Star()

    //MARK: - Init
    required init ?(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
    }
    override init(size: CGSize){
        super.init(size: size)
    }
    override func didMove(to view: SKView){
        self.setup()
    }
    
    //Delay Function
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)}
    
    //MARK: - Setup
    private func setup() {
        cameraNode.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        scoreLabel.zPosition = 3
        scoreLabel.position = CGPoint(x:kViewSize.height/2 + gameOverBox.frame.width/8, y:(kViewSize.width/2) - 20)
        scoreLabel.isHidden = true
        shotsLabel.zPosition = 3
        shotsLabel.position = CGPoint(x:kViewSize.height/2 + gameOverBox.frame.width/8, y:(kViewSize.width/2) + 10)
        shotsLabel.isHidden = true
        missedLabel.zPosition = 3
        missedLabel.position = CGPoint(x:kViewSize.height/2 + gameOverBox.frame.width/8, y:(kViewSize.width/2) - 40)
        missedLabel.isHidden = true
        addChild(scoreLabel)
        addChild(shotsLabel)
        addChild(missedLabel)
        
        delay(0.8){self.optionsBar.run(SKAction.move(by: CGVector(dx: 0, dy: -self.optionsBar.frame.height/6), duration:0.5))}
        BarUp = true
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.background)
        self.physicsWorld.contactDelegate = self
        cameraNode.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        
        // self.addChild(musicOn)
        // self.addChild(musicOut)
        // self.addChild(soundsOn)
        // self.addChild(optionsBar)
        // self.addChild(starInfo)
        
        self.addChild(Cup1)
        self.addChild(Cup2)
        self.addChild(Cup3)
        self.addChild(Cup4)
        self.addChild(Cup5)
        self.addChild(Cup6)
        self.addChild(Cup1Top)
        self.addChild(Cup2Top)
        self.addChild(Cup3Top)
        self.addChild(Cup4Top)
        self.addChild(Cup5Top)
        self.addChild(Cup6Top)
        
        attempts.isHidden = true
        attempts.setScale(1/2)
        attempts.zPosition = 3
        self.addChild(attempts)
        attempts.run(SKAction.fadeAlpha(to: 0, duration: 0))
        attempts.isHidden = false
        
        made.isHidden = true
        made.setScale(1/2)
        made.zPosition = 3
        self.addChild(made)
        made.run(SKAction.fadeAlpha(to: 0, duration: 0))
        made.isHidden = false
        
        missed.isHidden = true
        missed.setScale(1/2)
        missed.zPosition = 3
        self.addChild(missed)
        missed.run(SKAction.fadeAlpha(to: 0, duration: 0))
        missed.isHidden = false
 
        gameOverBox.isHidden = true
        self.addChild(gameOverBox)
        gameOverBox.run(SKAction.fadeAlpha(to: 0, duration: 0))
        gameOverBox.isHidden = false
        
        Cup1Made = false
        Cup2Made = false
        Cup3Made = false
        Cup4Made = false
        Cup5Made = false
        Cup6Made = false
        
        T1Hit = false
        T2Hit = false
        T3Hit = false
        T4Hit = false
        BallInAir = false
        
        Cup1.zPosition = 7
        Cup1Top.zPosition = 7
        Cup2.zPosition = 6
        Cup2Top.zPosition = 6
        Cup3.zPosition = 5
        Cup3Top.zPosition = 5
        Cup4.zPosition = 4
        Cup4Top.zPosition = 4
        Cup5.zPosition = 3
        Cup5Top.zPosition = 3
        Cup6.zPosition = 2
        Cup6Top.zPosition = 2
        
        Cup2.run(SKAction.move(by: CGVector(dx: self.Cup1.frame.width/2, dy:self.Cup1.frame.height/4), duration: 1))
        Cup2Top.run(SKAction.move(by: CGVector(dx: self.Cup1.frame.width/2, dy:self.Cup1.frame.height/4), duration: 1))
        Cup3.run(SKAction.move(by: CGVector(dx: -self.Cup1.frame.width/2, dy:self.Cup1.frame.height/4), duration: 1))
        Cup3Top.run(SKAction.move(by: CGVector(dx: -self.Cup1.frame.width/2, dy:self.Cup1.frame.height/4), duration: 1))
        Cup4.run(SKAction.move(by: CGVector(dx: -self.Cup1.frame.width, dy:self.Cup1.frame.height/2), duration: 1))
        Cup4Top.run(SKAction.move(by: CGVector(dx: -self.Cup1.frame.width, dy:self.Cup1.frame.height/2), duration: 1))
        Cup5.run(SKAction.move(by: CGVector(dx: 0, dy:self.Cup1.frame.height/2), duration: 1))
        Cup5Top.run(SKAction.move(by: CGVector(dx: 0, dy:self.Cup1.frame.height/2), duration: 1))
        Cup6.run(SKAction.move(by: CGVector(dx: self.Cup1.frame.width, dy:self.Cup1.frame.height/2), duration: 1))
        Cup6Top.run(SKAction.move(by: CGVector(dx: self.Cup1.frame.width, dy:self.Cup1.frame.height/2), duration: 1))
        
        delay(1.2){
            self.Cup1.zPosition = 10
            self.Cup1Top.zPosition = 12
            self.Cup2.zPosition = 7
            self.Cup2Top.zPosition = 9
            self.Cup3.zPosition = 7
            self.Cup3Top.zPosition = 9
            self.Cup4.zPosition = 4
            self.Cup4Top.zPosition = 6
            self.Cup5.zPosition = 4
            self.Cup5Top.zPosition = 6
            self.Cup6.zPosition = 4
            self.Cup6Top.zPosition = 6
        }
        
        escape.isHidden = true
        escape = SKSpriteNode(imageNamed: "x")
        escape.setScale(0.3)
        escape.run(SKAction.fadeAlpha(to: 0, duration: 0))
        self.addChild(escape)
        escape.isHidden = false
        escape.run(SKAction.fadeAlpha(to: 1, duration: 0.2))
        
        restart.isHidden = true
        restart = SKSpriteNode(imageNamed: "restart")
        restart.setScale(0.3)
        restart.run(SKAction.fadeAlpha(to: 0, duration: 0))
        self.addChild(restart)
        restart.isHidden = false
        restart.run(SKAction.fadeAlpha(to: 1, duration: 0.2))
        
        TexturedCup1 = SKSpriteNode(texture: CupTexture)
        TexturedCup1.physicsBody = SKPhysicsBody(texture: CupTexture, size: CGSize(width: CupTexture.size().width, height: CupTexture.size().height))
        TexturedCup1.physicsBody?.affectedByGravity = false
        TexturedCup1.physicsBody?.isDynamic = false
        TexturedCup1.isHidden = true
        
        TexturedCup2 = SKSpriteNode(texture: CupTexture)
        TexturedCup2.physicsBody = SKPhysicsBody(texture: CupTexture, size: CGSize(width: CupTexture.size().width, height: CupTexture.size().height))
        TexturedCup2.physicsBody?.affectedByGravity = false
        TexturedCup2.physicsBody?.isDynamic = false
        TexturedCup2.isHidden = true
        
        TexturedCup3 = SKSpriteNode(texture: CupTexture)
        TexturedCup3.physicsBody = SKPhysicsBody(texture: CupTexture, size: CGSize(width: CupTexture.size().width, height: CupTexture.size().height))
        TexturedCup3.physicsBody?.affectedByGravity = false
        TexturedCup3.physicsBody?.isDynamic = false
        TexturedCup3.isHidden = true
        
        TexturedCup4 = SKSpriteNode(texture: CupTexture)
        TexturedCup4.physicsBody = SKPhysicsBody(texture: CupTexture, size: CGSize(width: CupTexture.size().width, height: CupTexture.size().height))
        TexturedCup4.physicsBody?.affectedByGravity = false
        TexturedCup4.physicsBody?.isDynamic = false
        TexturedCup4.isHidden = true
        
        TexturedCup5 = SKSpriteNode(texture: CupTexture)
        TexturedCup5.physicsBody = SKPhysicsBody(texture: CupTexture, size: CGSize(width: CupTexture.size().width, height: CupTexture.size().height))
        TexturedCup5.physicsBody?.affectedByGravity = false
        TexturedCup5.physicsBody?.isDynamic = false
        TexturedCup5.isHidden = true
        
        TexturedCup6 = SKSpriteNode(texture: CupTexture)
        TexturedCup6.physicsBody = SKPhysicsBody(texture: CupTexture, size: CGSize(width: CupTexture.size().width, height: CupTexture.size().height))
        TexturedCup6.physicsBody?.affectedByGravity = false
        TexturedCup6.physicsBody?.isDynamic = false
        TexturedCup6.isHidden = true

        L1Ball = SKSpriteNode(imageNamed: "pongball")
        L1Ball.setScale(1)
        L1Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1)
        L1Ball.physicsBody = SKPhysicsBody(circleOfRadius: L1Ball.frame.height / 2)
        L1Ball.physicsBody?.categoryBitMask = PhysicsCategory.L1Ball
        L1Ball.physicsBody?.collisionBitMask = PhysicsCategory.Cup1Bottom
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Cup1Bottom
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Cup2Bottom
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Cup3Bottom
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Cup4Bottom
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Cup5Bottom
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Cup6Bottom
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.L1ActivatorT1
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.L1ActivatorT2
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.L1ActivatorT3
        L1Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Boundaries
        L1Ball.physicsBody?.restitution = 0.7
        L1Ball.physicsBody?.affectedByGravity = false
        L1Ball.physicsBody?.isDynamic = true
        L1Ball.zPosition = 10
        self.addChild(L1Ball)
        
        L1ActivatorT1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:kViewSize.width, height : 0.1))
        L1ActivatorT1.physicsBody?.categoryBitMask = PhysicsCategory.L1ActivatorT1
        L1ActivatorT1.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        L1ActivatorT1.physicsBody?.affectedByGravity = false
        L1ActivatorT1.physicsBody?.isDynamic = false
        L1ActivatorT1.zPosition = -50
        L1ActivatorT1.isHidden = true
        self.addChild(L1ActivatorT1)
        
        L1ActivatorT2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:kViewSize.width, height : 0.1))
        L1ActivatorT2.physicsBody?.categoryBitMask = PhysicsCategory.L1ActivatorT2
        L1ActivatorT2.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        L1ActivatorT2.physicsBody?.affectedByGravity = false
        L1ActivatorT2.physicsBody?.isDynamic = false
        L1ActivatorT2.zPosition = -50
        L1ActivatorT2.isHidden = true
        self.addChild(L1ActivatorT2)
        
        L1ActivatorT3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:kViewSize.width, height : 0.1))
        L1ActivatorT3.physicsBody?.categoryBitMask = PhysicsCategory.L1ActivatorT3
        L1ActivatorT3.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        L1ActivatorT3.physicsBody?.affectedByGravity = false
        L1ActivatorT3.physicsBody?.isDynamic = false
        L1ActivatorT3.zPosition = -50
        L1ActivatorT3.isHidden = true
        self.addChild(L1ActivatorT3)
        
        
        cameraNodePositioner = SKShapeNode(rectOf: CGSize(width: kViewSize.width, height: kViewSize.height))
        self.addChild(cameraNodePositioner)
        cameraNodePositioner.isHidden = true
        
        L1Boundaries.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: CGPoint(x: 1 - L1Ball.frame.height*2, y: -L1Ball.frame.height*2), size: CGSize(width: kViewSize.width-1 + (L1Ball.frame.height * 4), height: kViewSize.height-1 + (L1Ball.frame.height * 4))))
        L1Boundaries.physicsBody?.categoryBitMask = PhysicsCategory.L1Boundaries
        L1Boundaries.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        L1Boundaries.physicsBody?.affectedByGravity = false
        L1Boundaries.physicsBody?.isDynamic = false
        L1Boundaries.isHidden = true
        self.addChild(L1Boundaries)
        
        Cup1Bottom.setScale(3)
        Cup1Bottom.position = Cup1.position
        Cup1Bottom.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Cup1.frame.width/2, height: 0.1))
        Cup1Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Cup1Bottom
        Cup1Bottom.physicsBody?.collisionBitMask = PhysicsCategory.L1Ball
        Cup1Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        Cup1Bottom.physicsBody?.affectedByGravity = false
        Cup1Bottom.physicsBody?.isDynamic = false
        Cup1Bottom.zPosition = -50
        Cup1Bottom.isHidden = true
        Cup1Bottom.run(SKAction.move(by: CGVector(dx:0,dy:-self.Cup1.frame.height/2 + 7), duration: 0))
        
        Cup2Bottom.setScale(3)
        Cup2Bottom.position = Cup2.position
        Cup2Bottom.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Cup1.frame.width/2, height: 0.1))
        Cup2Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Cup2Bottom
        Cup2Bottom.physicsBody?.collisionBitMask = PhysicsCategory.L1Ball
        Cup2Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        Cup2Bottom.physicsBody?.affectedByGravity = false
        Cup2Bottom.physicsBody?.isDynamic = false
        Cup2Bottom.zPosition = -50
        Cup2Bottom.isHidden = true
        Cup2Bottom.run(SKAction.move(by: CGVector(dx:0,dy:-self.Cup1.frame.height/2 + 7), duration: 0))
        Cup2Bottom.run(SKAction.move(by: CGVector(dx: self.Cup1.frame.width/2, dy:self.Cup1.frame.height/4), duration: 0))
        
        Cup3Bottom.setScale(3)
        Cup3Bottom.position = Cup3.position
        Cup3Bottom.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Cup1.frame.width/2, height: 0.1))
        Cup3Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Cup3Bottom
        Cup3Bottom.physicsBody?.collisionBitMask = PhysicsCategory.L1Ball
        Cup3Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        Cup3Bottom.physicsBody?.affectedByGravity = false
        Cup3Bottom.physicsBody?.isDynamic = false
        Cup3Bottom.zPosition = -50
        Cup3Bottom.isHidden = true
        Cup3Bottom.run(SKAction.move(by: CGVector(dx:0,dy:-self.Cup1.frame.height/2 + 7), duration: 0))
        Cup3Bottom.run(SKAction.move(by: CGVector(dx: -self.Cup1.frame.width/2, dy:self.Cup1.frame.height/4), duration: 0))
        
        Cup4Bottom.setScale(3)
        Cup4Bottom.position = Cup4.position
        Cup4Bottom.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Cup1.frame.width/2, height: 0.1))
        Cup4Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Cup4Bottom
        Cup4Bottom.physicsBody?.collisionBitMask = PhysicsCategory.L1Ball
        Cup4Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        Cup4Bottom.physicsBody?.affectedByGravity = false
        Cup4Bottom.physicsBody?.isDynamic = false
        Cup4Bottom.zPosition = -50
        Cup4Bottom.isHidden = true
        Cup4Bottom.run(SKAction.move(by: CGVector(dx:0,dy:-self.Cup1.frame.height/2 + 7), duration: 0))
        Cup4Bottom.run(SKAction.move(by: CGVector(dx: -self.Cup1.frame.width, dy:self.Cup1.frame.height/2), duration: 0))

        Cup5Bottom.setScale(3)
        Cup5Bottom.position = Cup5.position
        Cup5Bottom.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Cup1.frame.width/2, height: 0.1))
        Cup5Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Cup5Bottom
        Cup5Bottom.physicsBody?.collisionBitMask = PhysicsCategory.L1Ball
        Cup5Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        Cup5Bottom.physicsBody?.affectedByGravity = false
        Cup5Bottom.physicsBody?.isDynamic = false
        Cup5Bottom.zPosition = -50
        Cup5Bottom.isHidden = true
        Cup5Bottom.run(SKAction.move(by: CGVector(dx:0,dy:-self.Cup1.frame.height/2 + 7), duration: 0))
        Cup5Bottom.run(SKAction.move(by: CGVector(dx: 0, dy:self.Cup1.frame.height/2), duration: 0))
        
        Cup6Bottom.setScale(3)
        Cup6Bottom.position = Cup6.position
        Cup6Bottom.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Cup1.frame.width/2, height: 0.1))
        Cup6Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Cup6Bottom
        Cup6Bottom.physicsBody?.collisionBitMask = PhysicsCategory.L1Ball
        Cup6Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.L1Ball
        Cup6Bottom.physicsBody?.affectedByGravity = false
        Cup6Bottom.physicsBody?.isDynamic = false
        Cup6Bottom.zPosition = -50
        Cup6Bottom.isHidden = true
        Cup6Bottom.run(SKAction.move(by: CGVector(dx:0,dy:-self.Cup1.frame.height/2 + 7), duration: 0))
        Cup6Bottom.run(SKAction.move(by: CGVector(dx: self.Cup1.frame.width, dy:self.Cup1.frame.height/2), duration: 0))

    }
    
    // MARK: - Contacts between different physics bodies
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.L1ActivatorT1 || firstBody.categoryBitMask == PhysicsCategory.L1ActivatorT1 && secondBody.categoryBitMask == PhysicsCategory.L1Ball){
            T1Hit = true
            L1Ball.zPosition = 11
            L1ActivatorT1.removeFromParent()
            if Cup1Made == false{
                addChild(Cup1Bottom)
                addChild(TexturedCup1)
            }
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.L1ActivatorT2 || firstBody.categoryBitMask == PhysicsCategory.L1ActivatorT2 && secondBody.categoryBitMask == PhysicsCategory.L1Ball){
            T2Hit = true
            L1Ball.zPosition = 8
            L1ActivatorT2.removeFromParent()
            if Cup2Made == false && Cup3Made == false{
                addChild(Cup2Bottom)
                addChild(Cup3Bottom)
                addChild(TexturedCup2)
                addChild(TexturedCup3)
            }
            if Cup2Made == false && Cup3Made == true{
                addChild(Cup2Bottom)
                addChild(TexturedCup2)
            }
            if Cup2Made == true && Cup3Made == false{
                addChild(Cup3Bottom)
                addChild(TexturedCup3)
            }
            Cup1Bottom.removeFromParent()
            TexturedCup1.removeFromParent()
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.L1ActivatorT3 || firstBody.categoryBitMask == PhysicsCategory.L1ActivatorT3 && secondBody.categoryBitMask == PhysicsCategory.L1Ball){
            T3Hit = true
            L1Ball.zPosition = 5
            L1ActivatorT3.removeFromParent()
            if Cup4Made == false && Cup5Made == false && Cup6Made == false{
                addChild(Cup4Bottom)
                addChild(Cup5Bottom)
                addChild(Cup6Bottom)
                addChild(TexturedCup4)
                addChild(TexturedCup5)
                addChild(TexturedCup6)
            }
            if Cup4Made == true && Cup5Made == false && Cup6Made == false{
                addChild(Cup5Bottom)
                addChild(Cup6Bottom)
                addChild(TexturedCup5)
                addChild(TexturedCup6)
            }
            if Cup4Made == false && Cup5Made == true && Cup6Made == false{
                addChild(Cup4Bottom)
                addChild(Cup6Bottom)
                addChild(TexturedCup4)
                addChild(TexturedCup6)
            }
            if Cup4Made == false && Cup5Made == false && Cup6Made == true{
                addChild(Cup5Bottom)
                addChild(Cup4Bottom)
                addChild(TexturedCup5)
                addChild(TexturedCup4)
            }
            if Cup4Made == true && Cup5Made == true && Cup6Made == false{
                addChild(Cup6Bottom)
                addChild(TexturedCup6)
            }
            if Cup4Made == false && Cup5Made == true && Cup6Made == true{
                addChild(Cup4Bottom)
                addChild(TexturedCup4)
            }
            if Cup4Made == true && Cup5Made == false && Cup6Made == true{
                addChild(Cup5Bottom)
                addChild(TexturedCup5)
            }
            Cup1Bottom.removeFromParent()
            Cup2Bottom.removeFromParent()
            Cup3Bottom.removeFromParent()
            TexturedCup1.removeFromParent()
            TexturedCup2.removeFromParent()
            TexturedCup3.removeFromParent()
            
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.Cup1Bottom || firstBody.categoryBitMask == PhysicsCategory.Cup1Bottom && secondBody.categoryBitMask == PhysicsCategory.L1Ball) {
            score += 1
            playSound()
            BallInAir = false
            Cup1Made = true
            T1Hit = false
            L1Ball.isHidden = true
            L1Ball.physicsBody?.affectedByGravity = false
            L1Ball.physicsBody?.isDynamic = false
            L1Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1)
            L1Ball.run(SKAction.fadeIn(withDuration:1))
            L1Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1), duration: 0.1))
            Cup1.run(SKAction.fadeOut(withDuration: 1))
            Cup1Top.run(SKAction.fadeOut(withDuration: 1))
            TexturedCup1.removeFromParent()
            Cup1Bottom.removeFromParent()
            addChild(L1ActivatorT1)
            cameraNode.run(zoomOutAction)
            cameraNodePositioner.run(zoomOutAction)
            delay(1){self.L1Ball.isHidden = false}
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.Cup2Bottom || firstBody.categoryBitMask == PhysicsCategory.Cup2Bottom && secondBody.categoryBitMask == PhysicsCategory.L1Ball) {
            score += 1
            playSound()
            BallInAir = false
            Cup2Made = true
            T1Hit = false
            T2Hit = false
            L1Ball.isHidden = true
            L1Ball.physicsBody?.affectedByGravity = false
            L1Ball.physicsBody?.isDynamic = false
            L1Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1)
            L1Ball.run(SKAction.fadeIn(withDuration:1))
            L1Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1), duration: 0.1))
            Cup2.run(SKAction.fadeOut(withDuration: 1))
            Cup2Top.run(SKAction.fadeOut(withDuration: 1))
            TexturedCup2.removeFromParent()
            Cup2Bottom.removeFromParent()
            TexturedCup3.removeFromParent()
            Cup3Bottom.removeFromParent()
            addChild(L1ActivatorT1)
            addChild(L1ActivatorT2)
            cameraNode.run(zoomOutAction)
            cameraNodePositioner.run(zoomOutAction)
            delay(1){self.L1Ball.isHidden = false}
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.Cup3Bottom || firstBody.categoryBitMask == PhysicsCategory.Cup3Bottom && secondBody.categoryBitMask == PhysicsCategory.L1Ball) {
            score += 1
            playSound()
            BallInAir = false
            Cup3Made = true
            T1Hit = false
            T2Hit = false
            L1Ball.isHidden = true
            L1Ball.physicsBody?.affectedByGravity = false
            L1Ball.physicsBody?.isDynamic = false
            L1Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1)
            L1Ball.run(SKAction.fadeIn(withDuration:1))
            L1Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1), duration: 0.1))
            Cup3.run(SKAction.fadeOut(withDuration: 1))
            Cup3Top.run(SKAction.fadeOut(withDuration: 1))
            TexturedCup2.removeFromParent()
            Cup2Bottom.removeFromParent()
            TexturedCup3.removeFromParent()
            Cup3Bottom.removeFromParent()
            cameraNode.run(zoomOutAction)
            cameraNodePositioner.run(zoomOutAction)
            delay(1){self.L1Ball.isHidden = false}
            addChild(L1ActivatorT1)
            addChild(L1ActivatorT2)
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.Cup4Bottom || firstBody.categoryBitMask == PhysicsCategory.Cup4Bottom && secondBody.categoryBitMask == PhysicsCategory.L1Ball) {
            score += 1
            playSound()
            BallInAir = false
            Cup4Made = true
            T1Hit = false
            T2Hit = false
            T3Hit = false
            L1Ball.isHidden = true
            Cup4.run(SKAction.fadeOut(withDuration: 1))
            Cup4Top.run(SKAction.fadeOut(withDuration: 1))
            L1Ball.physicsBody?.affectedByGravity = false
            L1Ball.physicsBody?.isDynamic = false
            L1Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1)
            L1Ball.run(SKAction.fadeIn(withDuration:1))
            L1Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1), duration: 0.1))
            TexturedCup4.removeFromParent()
            Cup4Bottom.removeFromParent()
            TexturedCup5.removeFromParent()
            Cup5Bottom.removeFromParent()
            TexturedCup6.removeFromParent()
            Cup6Bottom.removeFromParent()
            delay(1){self.L1Ball.isHidden = false}
            cameraNode.run(zoomOutAction)
            cameraNodePositioner.run(zoomOutAction)
            addChild(L1ActivatorT1)
            addChild(L1ActivatorT2)
            addChild(L1ActivatorT3)
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.Cup5Bottom || firstBody.categoryBitMask == PhysicsCategory.Cup5Bottom && secondBody.categoryBitMask == PhysicsCategory.L1Ball) {
            score += 1
            playSound()
            BallInAir = false
            Cup5Made = true
            T1Hit = false
            T2Hit = false
            T3Hit = false
            L1Ball.isHidden = true
            L1Ball.physicsBody?.affectedByGravity = false
            L1Ball.physicsBody?.isDynamic = false
            L1Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1)
            L1Ball.run(SKAction.fadeIn(withDuration:1))
            L1Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1), duration: 0.1))
            Cup5.run(SKAction.fadeOut(withDuration: 1))
            Cup5Top.run(SKAction.fadeOut(withDuration: 1))
            TexturedCup4.removeFromParent()
            Cup4Bottom.removeFromParent()
            TexturedCup5.removeFromParent()
            Cup5Bottom.removeFromParent()
            TexturedCup6.removeFromParent()
            Cup6Bottom.removeFromParent()
            delay(1){self.L1Ball.isHidden = false}
            cameraNode.run(zoomOutAction)
            cameraNodePositioner.run(zoomOutAction)
            addChild(L1ActivatorT1)
            addChild(L1ActivatorT2)
            addChild(L1ActivatorT3)
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.Cup6Bottom || firstBody.categoryBitMask == PhysicsCategory.Cup6Bottom && secondBody.categoryBitMask == PhysicsCategory.L1Ball) {
            score += 1
            playSound()
            BallInAir = false
            Cup6Made = true
            T1Hit = false
            T2Hit = false
            T3Hit = false
            L1Ball.isHidden = true
            Cup6.run(SKAction.fadeOut(withDuration: 1))
            L1Ball.physicsBody?.affectedByGravity = false
            L1Ball.physicsBody?.isDynamic = false
            L1Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1)
            L1Ball.run(SKAction.fadeIn(withDuration:1))
            L1Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1), duration: 0.1))
            Cup6.run(SKAction.fadeOut(withDuration: 1))
            Cup6Top.run(SKAction.fadeOut(withDuration: 1))
            TexturedCup4.removeFromParent()
            Cup4Bottom.removeFromParent()
            TexturedCup5.removeFromParent()
            Cup5Bottom.removeFromParent()
            TexturedCup6.removeFromParent()
            Cup6Bottom.removeFromParent()
            delay(1){self.L1Ball.isHidden = false}
            cameraNode.run(zoomOutAction)
            cameraNodePositioner.run(zoomOutAction)
            addChild(L1ActivatorT1)
            addChild(L1ActivatorT2)
            addChild(L1ActivatorT3)
        }
        if (firstBody.categoryBitMask == PhysicsCategory.L1Ball && secondBody.categoryBitMask == PhysicsCategory.L1Boundaries || firstBody.categoryBitMask == PhysicsCategory.L1Boundaries && secondBody.categoryBitMask == PhysicsCategory.L1Ball) {
            BallInAir = false
            L1Ball.isHidden = true
            L1Ball.zPosition = 9
            L1Ball.physicsBody?.affectedByGravity = false
            L1Ball.physicsBody?.isDynamic = false
            L1Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.1), duration: 0.1))
            delay(0.1){self.L1Ball.isHidden = false}
            L1ActivatorT1.removeFromParent()
            L1ActivatorT2.removeFromParent()
            L1ActivatorT3.removeFromParent()
            addChild(L1ActivatorT1)
            addChild(L1ActivatorT2)
            addChild(L1ActivatorT3)
            Cup1Bottom.removeFromParent()
            Cup2Bottom.removeFromParent()
            Cup3Bottom.removeFromParent()
            Cup4Bottom.removeFromParent()
            Cup5Bottom.removeFromParent()
            Cup6Bottom.removeFromParent()
            TexturedCup1.removeFromParent()
            TexturedCup2.removeFromParent()
            TexturedCup3.removeFromParent()
            TexturedCup4.removeFromParent()
            TexturedCup5.removeFromParent()
            TexturedCup6.removeFromParent()
            cameraNode.run(zoomOutAction)
            cameraNodePositioner.run(zoomOutAction)
        }
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        let action = SKAction.move(to: L1Ball.position, duration: 1)
        let action1 = SKAction.move(to: cameraNode.position, duration: 0)
        let actionAttempts = (SKAction.move(to: CGPoint(x: kViewSize.width * 0.2 + (attempts.frame.width/2), y: gameOverBox.position.y), duration: 0))
        let actionMade = (SKAction.move(to: CGPoint(x: kViewSize.width * 0.2 + (made.frame.width/2), y: gameOverBox.position.y - gameOverBox.frame.height/6), duration: 0))
        let actionMissed = (SKAction.move(to: CGPoint(x:  kViewSize.width * 0.2 + (missed.frame.width/2), y: gameOverBox.position.y - gameOverBox.frame.height/3), duration: 0))

        cameraNodePositioner.run(action1)
        gameOverBox.run(action1)
        attempts.run(actionAttempts)
        made.run(actionMade)
        missed.run(actionMissed)
        scoreLabel.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.75, y: made.position.y - made.frame.height/2), duration: 0))
        shotsLabel.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.75, y: attempts.position.y - made.frame.height/2), duration: 0))
        missedLabel.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.75, y: missed.position.y - made.frame.height/2), duration: 0))
        
        if BallInAir == true{
            cameraNode.run(action)
            escape.run(SKAction.fadeAlpha(to: 0, duration: 0.2))
            restart.run(SKAction.fadeAlpha(to: 0, duration: 0.2))
        }
        
        if BallInAir == false{
            cameraNode.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.width/2 + (Cup1.frame.height)), duration: 1))
            delay(1){
                self.escape.run(SKAction.fadeAlpha(to: 1, duration: 0.2))
                self.restart.run(SKAction.fadeAlpha(to: 1, duration: 0.2))
            }
        }
        
        L1ActivatorT1.position = CGPoint(x: kViewSize.width/2, y: Cup1.position.y + (Cup1.frame.height/2) + L1Ball.frame.height)
        L1ActivatorT2.position = CGPoint(x: kViewSize.width/2, y: Cup2.position.y + ((Cup2.frame.height*1.5)/2) + L1Ball.frame.height)
        L1ActivatorT3.position = CGPoint(x: kViewSize.width/2, y: Cup4.position.y + ((Cup4.frame.height*2)/2) + L1Ball.frame.height)
        TexturedCup1.position = Cup1.position
        TexturedCup2.position = Cup2.position
        TexturedCup3.position = Cup3.position
        TexturedCup4.position = Cup4.position
        TexturedCup5.position = Cup5.position
        TexturedCup6.position = Cup6.position
        escape.position = CGPoint(x: cameraNodePositioner.position.x + (kViewSize.width/2) - (escape.frame.width), y: cameraNodePositioner.position.y + (kViewSize.height/2) - (escape.frame.height))
        restart.position = CGPoint(x: cameraNodePositioner.position.x - (kViewSize.width/2) + (restart.frame.width), y: cameraNodePositioner.position.y + (kViewSize.height/2) - (restart.frame.height))
        
        if (Cup1Made == true && Cup2Made == true && Cup3Made == true && Cup4Made == true && Cup5Made == true && Cup6Made == true){
            gameOver = true
            scoreLabel.text = String(score)
            shotsLabel.text = String(shots)
            missedLabel.text = String(shots - score)
            missedLabel.isHidden = false
            scoreLabel.isHidden = false
            shotsLabel.isHidden = false
            saveScore()
            gameOverBox.run(SKAction.fadeAlpha(to: 1, duration: 0.5))
            made.run(SKAction.fadeAlpha(to: 1, duration: 0.5))
            missed.run(SKAction.fadeAlpha(to: 1, duration: 0.5))
            attempts.run(SKAction.fadeAlpha(to: 1, duration: 0.5))
            L1Ball.run(SKAction.fadeAlpha(to: 0, duration: 0.5))
        }
        
        // Positioning Icons on OptionsBar
        musicOn.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.3, y: optionsBar.position.y + 20), duration: 0))
        musicOut.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.3, y: optionsBar.position.y + 20), duration: 0))
        soundsOn.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.7, y: optionsBar.position.y + 20), duration: 0))
        soundsOff.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.7, y: optionsBar.position.y + 20), duration: 0))
        starInfo.run(SKAction.move(to: CGPoint(x: kViewSize.width * 0.16, y: optionsBar.position.y - optionsBar.frame.height * 0.4), duration: 0))
        if player2?.isPlaying == true{
            MusicCheck = true
        }
        if player2?.isPlaying == false{
            MusicCheck = false
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        if escape.contains(touchLocation){
            loadScene()
        }
        if restart.contains(touchLocation){
            loadScene2()
        }
        startPoint = touch.location(in: view)
        startPoint1 = touch.location(in: view)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        defer {
            startPoint = nil
        }
        guard touches.count == 1, let startPoint = startPoint else {
            return
        }
        if let touch = touches.first {

            L1Ball.isHidden = false
            let endPoint = touch.location(in: view)
            //Calculate vector from the delta and what not here
            direction = CGVector(dx: endPoint.x - startPoint.x, dy: endPoint.y - startPoint.y)
            let impulseDirectionX = (direction.dx / (kViewSize.width/20))
            var impulseDirectionY = (-direction.dy / (kViewSize.height/100))
            print("kViewSize: ", kViewSize)
            print("kViewSizeWidth: ", kViewSize.width)
            print("direction.dx: ", direction.dx)
            print("direction.dy: ", direction.dy)
            print("impulseDirectionX: ", impulseDirectionX)
            print("impulseDirectionY: ", impulseDirectionY)
            if (impulseDirectionY > 35){
                print("impulseDirectionY changed")
                impulseDirectionY = 35
            }
            
            // let power = impulseDirectionY/42

            if(gameOver == false && BallInAir == false){
                shots += 1
                L1Ball.zPosition = 13
                L1Ball.physicsBody?.affectedByGravity = true
                L1Ball.physicsBody?.isDynamic = true
                L1Ball.physicsBody?.applyImpulse(CGVector(dx: impulseDirectionX, dy: impulseDirectionY))
                cameraNode.run(zoomInAction)
                cameraNodePositioner.run(zoomInAction)
                BallInAir = true
            }
            
            if(gameOver == true){
                if gameOverBox.contains(endPoint){
                    loadScene2()
                }
            }
        }
    }
    
    // Options Bar handling
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
    
    // MARK: - Load Scene
    private func loadScene() {
        let scene = ChooseLevelScene(size: kViewSize)
        let transition = SKTransition.crossFade(withDuration: 0.3)
        self.view?.presentScene(scene, transition: transition)
        
    }
    
    // MARK: - Load Scene2
    private func loadScene2() {
        let scene = LOneScene(size: kViewSize)
        let transition = SKTransition.crossFade(withDuration: 0.3)
        self.view?.presentScene(scene, transition: transition)
    }
    
    // MARK: - Score Handling 
    
    private func saveScore() {
        if score > GameSettings.sharedInstance.getBestScore() {
            GameSettings.sharedInstance.saveBestScore(score: score)
        }
    }
}
