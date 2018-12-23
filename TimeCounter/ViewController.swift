//
//  ViewController.swift
//  TimeCounter
//
//  Created by Agnius Pazecka on 22/12/2018.
//  Copyright © 2018 Agnius Pazecka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stopwatch = Stopwatch()

    @IBOutlet weak var stopwatchLabel: UILabel!
    
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func appendButton(_ sender: UIButton) {
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        // scheduledTimer fires every 1 second and updates Stopwatch label
        Timer.scheduledTimer(timeInterval: 1, target: self,
                             selector: #selector(ViewController.updateStopwatchLabel(_:)), userInfo: nil, repeats: true)
        if sender.currentTitle == "Start" {
            sender.setTitle("Stop", for: .normal)
            stopwatch.start()
        } else {
            sender.setTitle("Start", for: .normal)
            stopwatch.stop()
        }
    }
    
    @objc func updateStopwatchLabel(_ timer: Timer) {
        //print(stopwatch)
        if stopwatch.isRunning {
            stopwatchLabel.text = stopwatch.elapsedTimeAsString
            totalTimeLabel.text = stopwatch.totalTimeAsString
        } else {
            timer.invalidate()
            // resets stopwatchLabel to 00:00:00
            stopwatchLabel.text = stopwatch.elapsedTimeAsString
        }
    }
    
}

