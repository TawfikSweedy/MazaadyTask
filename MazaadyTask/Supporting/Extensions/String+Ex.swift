//
//  String+Ex.swift
//  MazaadyTask
//
//  Created by sameh mohammed on 13/04/2025.
//

import Foundation
import UIKit

struct TimeParts {
    let days: Int
    let hours: Int
    let minutes: Int
}

extension Double {
    var timeParts: TimeParts {
        let totalSeconds = Int(self)

        let days = totalSeconds / 86400
        let hours = (totalSeconds % 86400) / 3600
        let minutes = (totalSeconds % 3600) / 60

        return TimeParts(days: days, hours: hours, minutes: minutes)
    }
}
