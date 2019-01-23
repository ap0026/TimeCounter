//
//  Stopwatch.swift
//  TimeCounter
//
//  Created by Agnius Pazecka on 22/12/2018.
//  Copyright © 2018 Agnius Pazecka. All rights reserved.
//

import UIKit


class Stopwatch {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    
    
    
    let defaults = UserDefaults.standard
    
    private var startTime: Date?
    
    var timeIntervalArray : [ TimeInterval ] = []
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow //+ 96390
        } else {
            return 0
        }
    }
    
    var totalTime : TimeInterval {
        
        
        return elapsedTime + timeIntervalArray.reduce(0, +)
    }
    
    var elapsedTimeAsString: String {
        return String(format: "%02d:%02d:%02d",
                      Int(elapsedTime/3600), Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60)), Int(elapsedTime.truncatingRemainder(dividingBy: 60)))
    }
    var totalTimeAsString: String {
        return String(format: "%02d:%02d:%02d",
                      Int(totalTime/3600), Int((totalTime / 60).truncatingRemainder(dividingBy: 60)), Int(totalTime.truncatingRemainder(dividingBy: 60)))
    }
    
    //read-only computed property
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = Date()
    }
    
    func stop() {
        timeIntervalArray.append(elapsedTime)
        
        
        
        //code for persisting to user defaults
        //defaults.set(timeIntervalArray, forKey: "StoredTimeIntervals")
        //print(timeIntervalArray)
        
        //totalTime = timeIntervalArray.reduce(0, +)
        //print(totalTimeAsString)
        startTime = nil
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
