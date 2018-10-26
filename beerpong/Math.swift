//
//  Math.swift
//  beerpong
//
//  Created by Steven on 10/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation
import SpriteKit

func DegreesToRadians(degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(Double.pi) / 180.0
}

func RadiansToDegrees(radians: CGFloat) -> CGFloat {
    return radians * 180.0 / CGFloat(Double.pi)
}

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)}
