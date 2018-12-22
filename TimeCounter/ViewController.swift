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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func appendButton(_ sender: UIButton) {
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        stopwatch.stop()
    }
    @IBAction func startButton(_ sender: UIButton) {
        
        // scheduledTimer fires every 1 second and updates Stopwatch label
        Timer.scheduledTimer(timeInterval: 1, target: self,
                             selector: #selector(ViewController.updateStopwatchLabel(_:)), userInfo: nil, repeats: true)
        
        stopwatch.start()
    }
    
    @objc func updateStopwatchLabel(_ timer: Timer) {
        print(stopwatch)
        if stopwatch.isRunning {
            stopwatchLabel.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }
    
}

