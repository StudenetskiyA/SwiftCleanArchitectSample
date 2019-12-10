//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class PeopleInteractor: IPeopleInteractor {
    let peopleRepository: IPeopleRepository

    init(peopleRepository: IPeopleRepository) {
        self.peopleRepository = peopleRepository
    }

    func getPeople(firstName: String, secondName: String) -> String? {
        return peopleRepository.getPeople(firstName: firstName, secondName: secondName)
    }

}