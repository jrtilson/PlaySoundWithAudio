//
//  ViewController.swift
//  PlaySoundWithVolume
//
//  Created by Jeff Tilson on 2015-09-30.
//  Copyright © 2015 Jeff Tilson. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    

    @IBOutlet weak var volumeView: MPVolumeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = NSBundle.mainBundle().pathForResource("my_fav_song", ofType: "mp3", inDirectory: "") {
            // Good, got a file
            let filePathUrl = NSURL.fileURLWithPath(filePath)
            
            // Try to instantiate the audio player
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOfURL: filePathUrl)
            } catch {
                print(error)
            }
        } else {
            print("filePath is empty!")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playSound(sender: UIButton) {
        self.audioPlayer.currentTime = 0.0
        self.audioPlayer.stop()
        self.audioPlayer.play()
    }
}

