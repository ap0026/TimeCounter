//
//  ViewController.swift
//  TimeCounter
//
//  Created by Agnius Pazecka on 22/12/2018.
//  Copyright © 2018 Agnius Pazecka. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    //var c: TimeInterval = 0
    
    let realm = try! Realm()

    let stopwatch = Stopwatch()
    
    let newSession = Sessions()
    
   // var sessionItems: Results<Sessions>?
    
    var timeIntervalArray : TimeInterval = 0
    
    var selectedCategory : Category? {
        didSet {
            //print(oldValue)
            loadItems()
        }
    }
    
   
    
    var totalTime : TimeInterval {
        return stopwatch.elapsedTime + timeIntervalArray
    }
    
    var totalTimeAsString: String {
        return String(format: "%02d:%02d:%02d",
                      Int(totalTime/3600), Int((totalTime / 60).truncatingRemainder(dividingBy: 60)), Int(totalTime.truncatingRemainder(dividingBy: 60)))
    }

    @IBOutlet weak var stopwatchLabel: UILabel!
    
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // getting timeIntervalArray from persisted data in UserDefaults
//        if let timeIntArray = stopwatch.defaults.array(forKey: "StoredTimeIntervals") as? [TimeInterval] {
//            stopwatch.timeIntervalArray = timeIntArray
//        }
        totalTimeLabel.text = totalTimeAsString
    }
    
    @IBAction func appendButton(_ sender: UIButton) {
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        
        // scheduledTimer fires every 1 second and updates Stopwatch label
        Timer.scheduledTimer(timeInterval: 1, target: self,
                             selector: #selector(ViewController.updateStopwatchLabel(_:)), userInfo: nil, repeats: true)
        
        // start/stop button
        if sender.currentTitle == "Start" {
            sender.setTitle("Stop", for: .normal)
            start()
        } else {
            sender.setTitle("Start", for: .normal)
            stop()
        }
        
    }
    
    @objc func updateStopwatchLabel(_ timer: Timer) {
        //print(stopwatch)
        if isRunning {
            stopwatchLabel.text = stopwatch.elapsedTimeAsString
            totalTimeLabel.text = totalTimeAsString
        } else {
            timer.invalidate()
            // resets stopwatchLabel to 00:00:00
            stopwatchLabel.text = stopwatch.elapsedTimeAsString
        }
    }
    
    func loadItems() {
    
        if let sessionItems = selectedCategory?.sessions
            //.sorted(byKeyPath: "elapsedTimeSave", ascending: false)
        {
            
            timeIntervalArray = sessionItems.sum(ofProperty: "elapsedTimeSave")
        } else {
            print("No items in category")
        }
        //print(sessionItems)
        //         let n = sessionItems?.count ?? 1
        //        for a in 0 ... n - 1 {
        //            let b = sessionItems?[a].elapsedTimeSave
        //            c = c + b!
        //        }
        //        sessionItems?.sum(ofProperty: "elapsedTimeSave")
        //
    }
    
    
    var isRunning: Bool {
        return stopwatch.startTime != nil
    }
    
    func start() {
        stopwatch.startTime = Date()
        newSession.startDate = stopwatch.startTime
    }
    
    func stop() {
        //stopwatch.timeIntervalArray.append(stopwatch.elapsedTime)
        newSession.elapsedTimeSave = stopwatch.elapsedTime
        
        if let currentCategory = selectedCategory {
            do {
                try realm.write {
                    currentCategory.sessions.append(newSession)
                }
            } catch {
                print("Error saving new session \(error)")
            }
            
        }
        
        stopwatch.startTime = nil
    }
    
}

