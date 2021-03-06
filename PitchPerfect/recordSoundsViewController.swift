//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Marcela Ceneviva Auslenter on 18/07/2017.
//  Copyright © 2017 Marcela Ceneviva Auslenter. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    override func viewDidLoad() {
        stopRecordingButton.isEnabled = false
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        recordButton.imageView?.contentMode = .scaleAspectFit
        stopRecordingButton.imageView?.contentMode = .scaleAspectFit
    }
    

    func enableDisableButtons(isRecording: Bool){
        
        if isRecording{
        stopRecordingButton.isEnabled=true
        recordButton.isEnabled=false
        recordLabel.text = "Recording an audio"
        }else{
        //se nao estiver gravando:
        stopRecordingButton.isEnabled=false
        recordButton.isEnabled=true
        recordLabel.text = "Click to record"
        }
    }

    @IBAction func recordAudio(_ sender: Any) {
        enableDisableButtons(isRecording: true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()    }
    
    @IBAction func stopRecording(_ sender: Any) {
        enableDisableButtons(isRecording: false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }else{
         print("recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="stopRecording"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}
