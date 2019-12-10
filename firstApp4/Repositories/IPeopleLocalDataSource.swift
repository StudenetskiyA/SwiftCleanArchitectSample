//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

protocol IPeopleLocalDataSource {

    func getPeople(firstName: String, secondName: String) -> String?

    func savePeople(firstName: String, secondName: String, result: String)

}