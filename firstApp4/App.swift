//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class App {
    var peoplePresenter : IPeoplePresenter?

    init() {

    }

    func getPeoplePresenter() -> IPeoplePresenter? {
        if (peoplePresenter == nil) {
            peoplePresenter = PeoplePresenter()
        }
        return peoplePresenter
    }

}