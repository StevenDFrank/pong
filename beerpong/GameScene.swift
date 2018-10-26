//===================================================
//===================================================
//               ~ GameScene.swift ~
//                 ~ SpaceRunner ~
//===================================================
//===================================================
//        Created by Steven Frank on 10/3/16.
//Copyright © 2016 Steven Frank. All rights reserved.
//===================================================
//===================================================

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //MARK: - Private instance constants
    private let background = Background()
    // private let player = Player()
    
    // MARK: - Private instance variables
    private var sceneLabel:SKLabelNode?
    
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
        self.backgroundColor = Colors.colorFromRGB(rgbvalue: Colors.background)
        self.addChild(background)
        //  self.addChild(player)
        
        /*sceneLabel = SKLabelNode(fontNamed: "Arial")
        sceneLabel?.text = "GameScene"
        sceneLabel?.fontSize = 32.0
        sceneLabel?.fontColor = SKColor.white
        sceneLabel?.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height / 2)
        self.addChild(sceneLabel!)*/
    }
    
    //MARK: - Update
    override func update(_ currentTime: TimeInterval){
    }
    //MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch:UITouch = touches.first! as UITouch  // We create a constant named 'touch' that is the first touch
        let touchLocation = touch.location(in: self)  // Then we can create another constant called 'touchLocation
        
        // player.updateTargetPosition(position: touchLocation)
        
        if sceneLabel!.contains(touchLocation) { // Ask the question, is 'touchLocation; within the coordinates of 'sceneLabel' on the screen? If it is, we call 'loadScene'
            loadScene()
        }
    }
    // MARK: - Load Scene
    private func loadScene() {
        let scene = MenuScene(size: kViewSize)
        let transition = SKTransition.fade(with: SKColor.black, duration: 0.4)
        
        self.view?.presentScene(scene, transition: transition)
    }
}
