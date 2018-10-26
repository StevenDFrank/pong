//===================================================
//===================================================
//          ~ GameViewController.swift ~
//                 ~ SpaceRunner ~
//===================================================
//===================================================
//        Created by Steven Frank on 10/3/16.
//Copyright © 2016 Steven Frank. All rights reserved.
//===================================================
//===================================================

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    private let background = Background()
    private let foreground = Foreground()
    private let foreground2 = Foreground2()
    private let background2 = Background2()
    
    override func viewWillLayoutSubviews() {  // Works better for landscape orientation (this is a fixed portrait orientation), and when displaying child views like ad banners
        super.viewWillLayoutSubviews()
        
        if let view = self.view as! SKView? {  // Casting the view as an SKView. If the view doesnt already have a SCENE we continue initialzing. This prevents accidental reloading of a scene when the orientation changes. << Good practice.
            if (view.scene == nil) {
                // self.initializeGestureRecognizer()
                if kDebug {  // First use of 'kDebug' conditional. If this global constant is true, we turn on some nice to have on-screen debugging that shows the crrent FPS, the number of nodes in the scene, the number of draws per frame it takes to render our game, and the boundaries around our physics bodies.
                    // view.showsFPS = true
                    // view.showsNodeCount = true
                    // view.showsDrawCount = true
                    // view.showsPhysics = true
                }
                
                if (MusicToggle == true){playSong()}
                
                let scene = MenuScene(size: kViewSize)  // Create a constant to our 'MenuScene' CLASS passing in the 'kViewSize' constant that tells it to INSTANCIATE with the size of the screen.
                let transition = SKTransition.crossFade(withDuration: 0.5) // Create a simple fade to black 'transition' that lasts for half a second.
                view.presentScene(scene, transition: transition) // Tell the view to present the scene with the 'transition'.
                
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {  // setting the variable for 'supportedInterfaceOrientations' to .portrait, meaning this game can only be run in portrait orientation.
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {  // We dont want the phone status bar to display, so we set the variable 'prefersStatusBarHidden' to true.
        return true
    }
}
