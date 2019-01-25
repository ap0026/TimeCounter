//
//  Stopwatch.swift
//  TimeCounter
//
//  Created by Agnius Pazecka on 22/12/2018.
//  Copyright © 2018 Agnius Pazecka. All rights reserved.
//

import UIKit


class Stopwatch {
    
    var startTime: Date?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow //+ 96390
        } else {
            return 0
        }
    }
    
   var elapsedTimeAsString: String {
        return String(format: "%02d:%02d:%02d",
                      Int(elapsedTime/3600), Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60)), Int(elapsedTime.truncatingRemainder(dividingBy: 60)))
    }
    

}
