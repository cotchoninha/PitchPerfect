//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Marcela Ceneviva Auslenter on 31/08/2017.
//  Copyright © 2017 Marcela Ceneviva Auslenter. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func playSoundForButton(_ sender: Any) {
        print("play sound")
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        print("stop playing sound")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
