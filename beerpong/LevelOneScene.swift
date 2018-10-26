//
//  MenuScene.swift
//  BeerPongGame
//
//  Created by Steven on 10/14/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import SpriteKit
import AVFoundation
import UIKit

class LevelOneScene: SKScene, SKPhysicsContactDelegate{
    
    //MARK: - Private Instance Variables
    private var Bottom = SKSpriteNode()
    private var LogoTop = SKSpriteNode()
    private var L1Bkrnd = SKSpriteNode()
    private var L1Cup1 = SKSpriteNode()
    private var L1Cup2 = SKSpriteNode()
    private var L1Cup3 = SKSpriteNode()
    private var L1Cup4 = SKSpriteNode()
    private var L1Cup5 = SKSpriteNode()
    private var L1Cup6 = SKSpriteNode()
    private var L1LS = SKSpriteNode()
    private var L1Vinette = SKSpriteNode()
    private var BottomSpawner = SKSpriteNode()
    private var BallInAir = Bool()
    private var BarUp = Bool()
    private var Ball = SKSpriteNode()
    
    //MARK: - Private Instance Constants
    
    let cameraNode = SKCameraNode()
    let zoomInAction = SKAction.scale(to: 0.33, duration: 2)
    let zoomOutAction = SKAction.scale(to: 1, duration: 2)
    let ballZoomInt = SKAction.sequence([SKAction.scale(to: 3, duration: 0.69),SKAction.scale(to:0.33, duration: 0.69)])
    
    //MARK: - Init
    required init ?(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)}
    
    override init(size: CGSize){
        super.init(size: size)}
    
    override func didMove(to view: SKView){
        self.setup()}
    
    //Mark: - Delay Function
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)}
    
    //Mark: - LoadScenes
    private func loadScene() {
        let scene = LevelOneScene(size: kViewSize)
        let transition = SKTransition.fade(with: UIColor.black, duration: 1)
        self.view?.presentScene(scene, transition: transition)}
//    private func loadScene2(){
//        let scene = AboutScene(size: kViewSize)
//        let transition = SKTransition.fade(with: UIColor.black, duration: 2)
//        self.view?.presentScene(scene, transition: transition)}
    
    //MARK: - Setup
    private func setup() {
        self.physicsWorld.contactDelegate = self
        cameraNode.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        self.addChild(cameraNode)
        self.camera = cameraNode
        L1Bkrnd = SKSpriteNode(imageNamed: "L1Bkrnd")
        L1Bkrnd.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        L1Bkrnd.setScale(1/6)
        L1Bkrnd.zPosition = 0
        self.addChild(L1Bkrnd)
        
        L1Cup1 = SKSpriteNode(imageNamed: "L1Cup1")
        L1Cup1.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        L1Cup1.setScale(1/6)
        L1Cup1.zPosition = 7
        self.addChild(L1Cup1)
        
        L1Cup2 = SKSpriteNode(imageNamed: "L1Cup2")
        L1Cup2.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        L1Cup2.setScale(1/6)
        L1Cup2.zPosition = 6
        self.addChild(L1Cup2)
        
        L1Cup3 = SKSpriteNode(imageNamed: "L1Cup3")
        L1Cup3.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        L1Cup3.setScale(1/6)
        L1Cup3.zPosition = 5
        self.addChild(L1Cup3)
        
        L1Cup4 = SKSpriteNode(imageNamed: "L1Cup4")
        L1Cup4.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        L1Cup4.setScale(1/6)
        L1Cup4.zPosition = 4
        self.addChild(L1Cup4)
        
        L1Cup5 = SKSpriteNode(imageNamed: "L1Cup5")
        L1Cup5.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        L1Cup5.setScale(1/6)
        L1Cup5.zPosition = 3
        self.addChild(L1Cup5)
        
        L1Cup6 = SKSpriteNode(imageNamed: "L1Cup6")
        L1Cup6.position = CGPoint(x: kViewSize.width/2,y: kViewSize.height/2)
        L1Cup6.setScale(1/6)
        L1Cup6.zPosition = 2
        self.addChild(L1Cup6)
        
        Ball = SKSpriteNode(imageNamed: "pongball")
        Ball.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.4)
        Ball.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        Ball.physicsBody?.collisionBitMask = PhysicsCategory.Bottom
        Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Bottom
        Ball.physicsBody?.contactTestBitMask = PhysicsCategory.BottomSpawner
        Ball.physicsBody = SKPhysicsBody(circleOfRadius: Ball.frame.height / 2)
        Ball.physicsBody?.affectedByGravity = false
        Ball.physicsBody?.isDynamic = true
        self.addChild(Ball)
        
        BottomSpawner = SKSpriteNode(imageNamed: "StartButton")
        BottomSpawner.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.6)
        BottomSpawner.physicsBody = SKPhysicsBody(rectangleOf: BottomSpawner.size)
        BottomSpawner.physicsBody?.categoryBitMask = PhysicsCategory.BottomSpawner
        BottomSpawner.physicsBody?.contactTestBitMask  = PhysicsCategory.Ball
        BottomSpawner.physicsBody?.affectedByGravity = false
        BottomSpawner.physicsBody?.isDynamic = true
        BottomSpawner.zPosition = -50
        BottomSpawner.isHidden = true
        self.addChild(BottomSpawner)
        
        Bottom = SKSpriteNode(imageNamed: "GameOverTitle")
        Bottom.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.4)
        Bottom.physicsBody = SKPhysicsBody(rectangleOf: Bottom.size)
        Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Bottom
        Bottom.physicsBody?.collisionBitMask = PhysicsCategory.Ball
        Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.Ball
        Bottom.physicsBody?.affectedByGravity = false
        Bottom.physicsBody?.isDynamic = false
        Bottom.zPosition = -50
        Bottom.isHidden = true
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        let action = SKAction.move(to: Ball.position, duration: 1)
        cameraNode.run(action)
    }
    
    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        if L1Bkrnd.contains(touchLocation){
            Ball.physicsBody?.affectedByGravity = true
            Ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            Ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 140))
            cameraNode.run(zoomInAction)
            Ball.run(ballZoomInt)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        print("activater hiit")
        
        if (firstBody.categoryBitMask == PhysicsCategory.Ball && secondBody.categoryBitMask == PhysicsCategory.BottomSpawner || firstBody.categoryBitMask == PhysicsCategory.BottomSpawner && secondBody.categoryBitMask == PhysicsCategory.Ball) {
            print("activater hit")
            BottomSpawner.removeFromParent()
            addChild(Bottom)
            BottomSpawner.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 0))
            Ball.zPosition = 2

            }
        
        if (firstBody.categoryBitMask == PhysicsCategory.Ball && secondBody.categoryBitMask == PhysicsCategory.Bottom || firstBody.categoryBitMask == PhysicsCategory.Bottom && secondBody.categoryBitMask == PhysicsCategory.Ball) {
            playSound()
            delay(0.8){
            self.cameraNode.run(self.zoomOutAction)
            self.Ball.position = CGPoint(x: self.frame.width/2, y: self.frame.height * 0.2)
            self.Ball.run(SKAction.move(to: CGPoint(x: kViewSize.width/2, y: kViewSize.height * 0.4), duration: 0.5))
            print("bottom hit")
            }
        }
    }
}
