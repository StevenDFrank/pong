//
//  MenuScene.swift
//  beerpong
//
//  Created by Steven on 10/14/16.
//  Copyright © 2016 Steven. All rights reserved.
//


import SpriteKit
import AVFoundation
import AudioToolbox

class MenuScene: SKScene, SKPhysicsContactDelegate{

    //MARK: - Private Instance Variables
    private var Ball = SKSpriteNode()
    private var Bottom = SKSpriteNode()
    private var LogoTop = SKSpriteNode()
    private var startPoint: CGPoint?
    private var touchTime = NSDate()
    private var direction = CGVector()
    private var Effect1 = SKSpriteNode()
    private var Effect2 = SKSpriteNode()
    private var titleMask = SKSpriteNode()
    private var Mask = SKSpriteNode()
    private var actions = Array<SKAction>()
    private var firstActions = Array<SKAction>()
    private var BarUp = Bool()
    private var MusicCheck = Bool()
    private var effectsNode = SKEffectNode()
    
    //MARK: - Private Instance Constants
    private let optionsBar = OptionsBar()
    private let musicOn = MusicOn()
    private let musicOut = MusicOut()
    private let soundsOn = SoundsOn()
    private let soundsOff = SoundsOff()
    private let cupMainTop = CupMainTop()
    private let cupMain = CupMain()
    private let cupLeft = CupLeft()
    private let cupRight = CupRight()
    private let title = GameTitle()
    private let playButton = PlayButton()
    private let background = Background()
    private let foreground = Foreground()
    private let foreground2 = Foreground2()
    private let background2 = Background2()
    private let starInfo = Star()
    private let maskParent = SKSpriteNode()
    private let cropNode = SKCropNode()
    private let LogoEffect = SKAction.repeatForever(SKAction.sequence([SKAction.move(by: CGVector(dx: kViewSize.width * 8, dy: 0), duration: 4), SKAction.move(by: CGVector(dx: -kViewSize.width * 8, dy: 0), duration: 0)]))
    private let LogoEffect2 = SKAction.repeatForever(SKAction.sequence([SKAction.move(by: CGVector(dx: kViewSize.width * 4, dy: 0), duration: 4), SKAction.move(by: CGVector(dx: -kViewSize.width * 4, dy: 0), duration: 0)]))
    
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
    
    //MARK: - Setup
    private func setup() {
        
        self.physicsWorld.contactDelegate = self
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.background)
        self.addChild(optionsBar)
        self.addChild(background)
        self.addChild(foreground)
        self.addChild(background2)
        self.addChild(foreground2)
        self.addChild(cupMain)
        self.addChild(cupMainTop)
        self.addChild(cupRight)
        self.addChild(cupLeft)
        self.addChild(playButton)
        self.addChild(title)
        self.addChild(musicOn)
        self.addChild(musicOut)
        self.addChild(soundsOn)
        // self.addChild(soundsOff)
        self.addChild(starInfo)
       
        
        BarUp = true
        
        cropNode.maskNode = title
        cropNode.zPosition = 13
        
        Effect1 = SKSpriteNode(imageNamed: "Effect1")
        Effect1.setScale(1)
        Effect1.position = CGPoint(x: kViewSize.width * -0.4, y: kViewSize.height * 0.8)
        Effect1.zPosition = 10
        
        Effect2 = SKSpriteNode(imageNamed: "Effect1")
        Effect2.setScale(1)
        Effect2.position = CGPoint(x: 0, y: kViewSize.height * 0.8)
        Effect2.zPosition = 10
        
        /*let filter = CIFilter(name: "CIPhotoEffectMono")
        filter?.setDefaults()
        effectsNode.filter = filter
        self.addChild(effectsNode)
        effectsNode.addChild(playButton)*/
        
        cropNode.addChild(Effect1)
        cropNode.addChild(Effect2)
        
        Ball = SKSpriteNode(imageNamed: "pongball")
        Ball.setScale(1)
        Ball.position = CGPoint(x: self.frame.width/2, y: self.frame.height + Ball.frame.height)
        Ball.physicsBody = SKPhysicsBody(circleOfRadius: Ball.frame.height / 2)
        Ball.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        Ball.physicsBody?.collisionBitMask = PhysicsCategory.Bottom
        Ball.physicsBody?.contactTestBitMask  = PhysicsCategory.Bottom
        Ball.physicsBody?.affectedByGravity = false
        Ball.physicsBody?.isDynamic = true
        Ball.zPosition = 8
        self.addChild(Ball)
        
        Bottom = SKSpriteNode(imageNamed: "GameOverTitle")
        Bottom.setScale(1)
        Bottom.position = CGPoint(x: self.frame.width/2, y: self.frame.height * 0.30)
        Bottom.physicsBody = SKPhysicsBody(rectangleOf: Bottom.size)
        Bottom.physicsBody?.categoryBitMask = PhysicsCategory.Bottom
        Bottom.physicsBody?.collisionBitMask = PhysicsCategory.Ball
        Bottom.physicsBody?.contactTestBitMask  = PhysicsCategory.Ball
        Bottom.physicsBody?.affectedByGravity = false
        Bottom.physicsBody?.isDynamic = false
        Bottom.zPosition = -50
        Bottom.isHidden = true
        self.addChild(Bottom)

        scenetransitionIn()
    }
    
    // MARK: - Update
    override func update(_ currentTime: TimeInterval) {
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
    
    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch  // Create a constant named 'touch' that is the first touch. Then we can create another constant called 'touchLocation that holds the location on screen that the player touched.
        let touchLocation = touch.location(in: self)
        startPoint = touch.location(in: view)
        touchTime = NSDate()
        if playButton.contains(touchLocation){
            playSound1()
            Ball.physicsBody?.affectedByGravity = true
            if BarUp == false{
                optionsBarPress()
            }
        }
        else if starInfo.contains(touchLocation){
            playSound1()
            optionsBarPress()
        }
        else if musicOut.contains(touchLocation){
            MusicPress()
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
            direction = CGVector(dx: endPoint.x - startPoint.x, dy: endPoint.y - startPoint.y)
            // let elapsedTime = touchTime.timeIntervalSinceNow
            // let angle = atan2f(Float(direction.dy), Float(direction.dx))
    
        }
        if direction.dx < -50 {
            if BarUp == false{
                optionsBarPress()
                delay(0.6){
                    playSound1()
                    self.loadScene4()
                }
            }
            else{
                playSound1()
                loadScene4()
            }
        }
        /*if direction.dx > 50 {
            if BarUp == false{
                optionsBarPress()
                delay(0.6){
                    playSound1()
                    self.loadScene5()
                }
            }
            else{
                playSound1()
                loadScene5()
            }
        }*/
    }
    
    // MARK: - Contact
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        if (firstBody.categoryBitMask == PhysicsCategory.Ball && secondBody.categoryBitMask == PhysicsCategory.Bottom || firstBody.categoryBitMask == PhysicsCategory.Bottom && secondBody.categoryBitMask == PhysicsCategory.Ball) {
            playSound()
            Ball.physicsBody?.isDynamic = false
            Ball.isHidden = true
            scenetransitionOut()
            delay(1){self.loadScene()}
        }
    }
    
    // MARK: - Load Scene
    private func loadScene() {
        let scene = ChooseLevelScene(size: kViewSize)
        let transition = SKTransition.crossFade(withDuration: 0)
        self.view?.presentScene(scene, transition: transition)
    }
    
    // MARK: - Load Scene 4
    private func loadScene4() {
        let scene = ChooseLevelScene(size: kViewSize)
        let transition = SKTransition.push(with: SKTransitionDirection.left, duration: 0.3)
        self.view?.presentScene(scene, transition: transition)
        
    }
    
    //MARK: - OptionsBarHandling 
    func optionsBarPress(){
        if BarUp == true{
            BarUp = false
            self.optionsBar.run(SKAction.sequence([SKAction.move(by: CGVector(dx: 0, dy:20), duration: 0.2), SKAction.move(by: CGVector(dx: 0, dy:-optionsBar.frame.height+optionsBar.frame.height/6), duration: 0.4)]))
            effectsNode.isHidden = false
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
    
    //MARK: - Transitions
    private func scenetransitionIn(){
        let scaleUpthenDown = SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.4),SKAction.scale(to: 1, duration: 0.1)])
        let scaleUpthenDown2 = SKAction.sequence([SKAction.scale(to: 0.3, duration: 0.4),SKAction.scale(to: 0.25, duration: 0.1)])
        
        delay(0.1){self.title.run(scaleUpthenDown)
            self.playButton.run(scaleUpthenDown)}
        delay(0.2){self.cupMain.run(scaleUpthenDown2)
            self.cupMainTop.run(scaleUpthenDown2)}
        delay(0.3){self.cupRight.run(scaleUpthenDown2)}
        delay(0.4){self.cupLeft.run(scaleUpthenDown2)}
        delay(0.5){self.cupLeft.run(scaleUpthenDown2)}
        delay(0.8){
            self.playButton.startPulse()
            self.Effect1.run(self.LogoEffect)
            self.Effect2.run(self.LogoEffect2)
            self.addChild(self.cropNode)
            self.logoMoveEffect()
            self.logoMoveEffectLeft()
            self.logoMoveEffectRight()
            self.optionsBar.run(SKAction.move(by: CGVector(dx: 0, dy: -self.optionsBar.frame.height/6), duration:0.5))
        }
    }
    
    private func scenetransitionOut(){
        playButton.removeAllActions()
        Effect1.removeAllActions()
        Effect2.removeAllActions()
        
        let transitionOut = SKAction.sequence([SKAction.scale(to: 1.1, duration:0.1),SKAction.scale(to: 0, duration:0.4)])
        let transitionOut2 = SKAction.sequence([SKAction.scale(to: 0.3, duration:0.1),SKAction.scale(to: 0, duration:0.4)])

        delay(0.5){self.cupMain.run(transitionOut2)
            self.cupMainTop.run(transitionOut2)
            self.optionsBar.run(SKAction.move(by: CGVector(dx: 0, dy: self.optionsBar.frame.height/3), duration:0.5))}
        delay(0.4){self.cupLeft.run(transitionOut2)}
        delay(0.3){self.cupRight.run(transitionOut2)}
        self.Effect1.run(transitionOut)
        self.Effect2.run(transitionOut)
        self.title.run(transitionOut)
        delay(0.2){self.playButton.run(transitionOut)}
    }
    
    //MARK: - Effects
    private func logoMoveEffect(){ // Effect on main Logo
        // Move
        actions.append(SKAction.sequence([SKAction.move(by: CGVector(dx: 0, dy: -26), duration: 6), SKAction.wait(forDuration: 6)]))
        actions.append(SKAction.sequence([SKAction.wait(forDuration: 6), SKAction.move(by: CGVector(dx: 0, dy: 26), duration: 6)]))
        // Rotate
        actions.append(SKAction.sequence([SKAction.wait(forDuration: 0), SKAction.rotate(byAngle: CGFloat(Double.pi/8), duration: 6), SKAction.wait(forDuration: 6)]))
        actions.append(SKAction.sequence([SKAction.wait(forDuration: 6), SKAction.rotate(byAngle: CGFloat(-Double.pi/8), duration: 6)]))
        // First Move
        firstActions.append(SKAction.move(by: CGVector(dx: 0, dy: 13), duration: 3))
        // First Rotate
        firstActions.append(SKAction.rotate(byAngle: CGFloat(-Double.pi/16), duration: 3))
        // Group and Run
        let group = SKAction.group(actions)
        let firstGroup = SKAction.group(firstActions)
        
        cupMainTop.run(SKAction.sequence([firstGroup, SKAction.repeatForever(group)]))
        cupMain.run(SKAction.sequence([firstGroup, SKAction.repeatForever(group)]))
    }
    
    private func logoMoveEffectLeft(){ // Effect on main Logo
        // Move
        actions.append(SKAction.sequence([SKAction.move(by: CGVector(dx: -10, dy: 26), duration: 6), SKAction.wait(forDuration: 6)]))
        actions.append(SKAction.sequence([SKAction.wait(forDuration: 6), SKAction.move(by: CGVector(dx: 10, dy: -26), duration: 6)]))
        // Rotate
        actions.append(SKAction.sequence([SKAction.rotate(byAngle: CGFloat(Double.pi/8), duration: 6), SKAction.wait(forDuration: 6)]))
        actions.append(SKAction.sequence([SKAction.wait(forDuration: 6), SKAction.rotate(byAngle: CGFloat(-Double.pi/8), duration: 6)]))
        // First Move
        firstActions.append(SKAction.move(by: CGVector(dx: 5, dy: 13), duration: 3))
        // First Rotate
        firstActions.append(SKAction.rotate(byAngle: CGFloat(-Double.pi/16), duration: 3))
        // Group and Run
        let group = SKAction.group(actions)
        let firstGroup = SKAction.group(firstActions)
        
        cupLeft.run(SKAction.sequence([firstGroup, SKAction.repeatForever(group)]))
    }
    
    private func logoMoveEffectRight(){ // Effect on main Logo
        // Move
        actions.append(SKAction.sequence([SKAction.move(by: CGVector(dx: 10, dy: -26), duration: 8), SKAction.wait(forDuration: 8)]))
        actions.append(SKAction.sequence([SKAction.wait(forDuration: 8), SKAction.move(by: CGVector(dx: -10, dy: 26), duration: 8)]))
        // Rotate
        actions.append(SKAction.sequence([SKAction.rotate(byAngle: CGFloat(Double.pi/8), duration: 8), SKAction.wait(forDuration: 8)]))
        actions.append(SKAction.sequence([SKAction.wait(forDuration: 8), SKAction.rotate(byAngle: CGFloat(-Double.pi/8), duration: 8)]))
        // First Move
        firstActions.append(SKAction.move(by: CGVector(dx: -5, dy: 13), duration: 3))
        // First Rotate
        firstActions.append(SKAction.rotate(byAngle: CGFloat(-Double.pi/16), duration: 3))
        // Group and Run
        let group = SKAction.group(actions)
        let firstGroup = SKAction.group(firstActions)
        
        cupRight.run(SKAction.sequence([firstGroup, SKAction.repeatForever(group)]))
    }
}

