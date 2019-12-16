//
// Created by Александр Студенецкий on 13.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class LogInteractor : ILogInteractor {
    let logRepository : Log

    init(logRepository: Log) {
        self.logRepository = logRepository
    }

    func clearLog() {
        logRepository.clearLog()
    }

    func getLog() -> String{
        logRepository.getLog()
    }
    
}