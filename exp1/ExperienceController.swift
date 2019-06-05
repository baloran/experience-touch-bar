//
//  ExperienceController.swift
//  exp1
//
//  Created by baloran on 05/06/2019.
//  Copyright © 2019 baloran. All rights reserved.
//

import Foundation
import Cocoa
import AVFoundation

class ExperienceViewController: NSViewController , NSTouchBarDelegate {
    var btn: NSButton!
    var btnRect: CGRect!
    var camaradeView: NSImageView!
    var currentCamarade: Int = 0
    var currentPos: Double = 0
    var currentDirection: Int = 1
    var timer:Timer? = nil
    var speed: Double = 3
    @objc var audio_player: AVAudioPlayer?
    
    func getNameOfCamarade() -> String {
        return "walk_" + String(currentCamarade) + "_" + String(currentDirection)
    }
    
    func moveCamarade(){
        let name = getNameOfCamarade()
        camaradeView.image = NSImage(named: name)
        camaradeView.frame = CGRect(x: currentPos, y: 0, width: 25, height: 25)
    }
    
    @objc func orchestreCamarade () {
        moveCamarade()
        
        if (currentCamarade+1 == 4) {
            currentCamarade = 0
        } else {
            currentCamarade = currentCamarade + 1
        }
        if (currentPos > 660 && currentDirection == 1) {
            currentDirection = 0
        } else if(currentPos == 0 && currentDirection == 0) {
            currentDirection = 1
        }
        
        if (currentDirection > 0) {
            currentPos += speed
        } else {
            currentPos -= speed
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        btnRect = CGRect(
            x: currentPos,
            y: 0,
            width: 25,
            height: 25
        )
        
        let name = getNameOfCamarade()
        
        camaradeView = NSImageView(frame: btnRect)
        camaradeView.image = NSImage(named: name)
        view.addSubview(camaradeView)
        
        moveCamarade()
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(self.orchestreCamarade),
            userInfo: nil,
            repeats: true
        )
    }
    
    override func viewWillAppear() {
        guard let run = Bundle.main.url(forResource: "run", withExtension: "mp3") else { return }
        
        do {
            try audio_player = AVAudioPlayer(contentsOf: run)
            audio_player?.numberOfLoops = -1
            audio_player?.prepareToPlay()
            audio_player?.play()
        } catch{}
    }
}
