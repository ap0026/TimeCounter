//
//  Sessions.swift
//  TimeCounter
//
//  Created by Agnius Pazecka on 21/01/2019.
//  Copyright © 2019 Agnius Pazecka. All rights reserved.
//

import Foundation
import RealmSwift

class Sessions: Object {
    @objc dynamic var startDate: Date?
    @objc dynamic var elapsedTimeSave: TimeInterval = 0
    var parentCategory = LinkingObjects(fromType: Category.self, property: "sessions")
    
}
