//
//  Alarm.swift
//  DreamRecorder
//
//  Created by JU HO YOON on 2017. 8. 7..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import Foundation

class Alarm {
    var id : String
    var date: Date
    
    init(id : String, date: Date) {
        self.id = id
        self.date = date
    }
}