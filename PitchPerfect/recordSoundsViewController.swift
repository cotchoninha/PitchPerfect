//
//  recordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Marcela Ceneviva Auslenter on 18/07/2017.
//  Copyright © 2017 Marcela Ceneviva Auslenter. All rights reserved.
//

import UIKit
import AVFoundation

class recordSoundsViewControllerr: UIViewController {
    
    var audioRecorder: AVAudioRecorder!
    
    

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        stopRecordingButton.isEnabled = false
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func recordAudio(_ sender: Any) {
        stopRecordingButton.isEnabled=true
        recordButton.isEnabled=false
        recordLabel.text = "Recording an audio"
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()    }
    
    @IBAction func stopRecording(_ sender: Any) {
        stopRecordingButton.isEnabled=false
        recordButton.isEnabled=true
        recordLabel.text = "Click to record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

}

