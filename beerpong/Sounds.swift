//
//  Sounds.swift
//  beerpong
//
//  Created by Steven on 10/17/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

var player: AVAudioPlayer?
var player1: AVAudioPlayer?
var player2: AVAudioPlayer?

func playSound() {
    guard let sound = NSDataAsset(name: "pongsound") else {
    print("asset not found")
    return
    }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
            
        player1 = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
            
        player1!.play()
    } catch let error as NSError {
        print("error: \(error.localizedDescription)")
    }
}

func playSound1() {
    guard let sound = NSDataAsset(name: "soundeffect1") else {
        print("asset not found")
        return
    }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
    
        player = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
    
        player!.play()
    } catch let error as NSError {
        print("error: \(error.localizedDescription)")
    }
}

func playSong() {
    guard let sound = NSDataAsset(name: "PongMainSong") else {
        print("asset not found")
        return
        }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
    
        player2 = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
        
        player2!.play()
    }
    catch let error as NSError {
        print("error: \(error.localizedDescription)")
    }
}

func MuteMusic(){
    guard let sound = NSDataAsset(name: "soundeffect1") else {
        print("asset not found")
        return
    }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player2 = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
        
        player2!.play()
    }
    catch let error as NSError {
        print("error: \(error.localizedDescription)")
    }
}
