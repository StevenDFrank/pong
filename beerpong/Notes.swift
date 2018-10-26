//
//  Notes.swift
//  beerpong
//
//  Created by Steven on 10/30/16.
//  Copyright © 2016 Steven. All rights reserved.
//

// SKAction.waitForDuration(0.5)
// SKAction.fadeAlphaTo(0.75, duration: 3),
// SKAction.fadeOutWithDuration(3)

/*
 let filter = CIFilter(name: "CIGaussianBlur")
 let blurAmount = 4.0
 filter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
 effectsNode.filter = filter
 effectsNode.blendMode = .alpha
 self.addChild(effectsNode)
 effectNode.addChild(SKSpriteNode)
 
 Gradual Blur below
 private func Blurnode(){
 // Set up an effect node that will blur its children
 let blurNode = SKEffectNode()
 let blur = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": 1.0])
 blurNode.filter = blur
 addChild(blurNode)
 
 // Move everything in the scene into the blur node
 playButton.removeFromParent()
 blurNode.addChild(playButton)
 
 // Set up our blur to grow over the next two seconds
 let blurDuration = 2.0
 let blurMax: CGFloat = 10
 let blurAction = SKAction.customAction(withDuration: blurDuration, actionBlock: { (node:SKNode!, elapsed: CGFloat) -> Void in
 blur?.setValue((CGFloat(elapsed) / CGFloat(blurDuration))*blurMax, forKey: "inputRadius")
 })
 // Blur!
 blurNode.run(blurAction)
 }

 
 Custom SKPhysicsBody
 ~~~~~~~~~~~~~~~~~~~~~~
 let CupTexture = SKTexture(imageNamed: "Cup")
 let TexturedCup = SKSpriteNode(texture: CupTexture)
 TexturedCup.physicsBody = SKPhysicsBody(texture: CupTexture, size: size)
 TexturedCup.position = CGPoint(x: kViewSize.width/2, y: kViewSize.height/2)
 addChild(TexturedCup)
*/
