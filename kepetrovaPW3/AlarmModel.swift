//
//  AlarmModel.swift
//  kepetrovaPW3
//
//  Created by Ksenia Petrova on 21.10.2021.
//

import Foundation

class AlarmModel {
    var time: Int
    var button: Bool
    
    init(time: Int, button: Bool){
        self.time = time
        self.button = button
    }
    
    static var alarms: [AlarmModel] = []
}
