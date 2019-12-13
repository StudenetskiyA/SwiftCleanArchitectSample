//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

protocol IPeoplePresenter {

    func getPeople(firstName: String, secondName: String)

    func clearLog()

    func getLog()

    func bindView(view: IPeopleView)

    func unbindView()

}