//
//  Colors.swift
//  beerpong
//
//  Created by Steven on 10/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation

import SpriteKit

class Colors {
    
    // RGB Colors
    class var background:Int        { return 0xFFC60D }  // create a class variable 'background' of type Int and define it to return the hex value of our dark blue color. This is the same color we set the LaunchScreen background to. We'll add more colors to this as we grogress through building the game.
    
    class var dust:Int              { return 0x04f2de }
    class var engine:Int            { return 0x55f87e }
    /*
    class var bonus:Int             { return 0xb3ff01 }
    class var score:Int             { return 0xe6e7e8 }
    class var border:Int            { return 0x49b9ea }
     */
    
    class func colorFromRGB(rgbvalue rgbValue: Int) -> SKColor {  // colorFromRGB(rgbValue:) takes an RGB value expressed in hex and returns an SKColor. It does this by taking the bits for the Red, Green, and Blue values and transforms them into percentages for each. The Alpha is 1.0, or fully opaque.
        return SKColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1.0)
    }
}
