//
// Created by Александр Студенецкий on 12.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class Log {
    static func d(moduleName: String, message: String) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long

        print(formatter.string(from: currentDateTime) + " : " + moduleName + " - " + message)
    }

}