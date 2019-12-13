//
// Created by Александр Студенецкий on 13.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

protocol ILogInteractor {
    //Запись в лог делаю не через интерактор - она есть во всех модулях.
    //Это нарушает чистоту архитектуры, но иначе очень неудобно

    func clearLog()

    func getLog() -> String
}