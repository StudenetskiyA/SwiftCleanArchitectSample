//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class App {
    var peoplePresenter : IPeoplePresenter?
    var peopleInteractor : IPeopleInteractor?
    var peopleRepository : IPeopleRepository?
    var peopleLocalDataSource: IPeopleLocalDataSource?
    var peopleServiceDataSource : IPeopleRemoteDataSource?

    init() {

    }

    func getPeoplePresenter() -> IPeoplePresenter {
        if (peoplePresenter == nil) {
            peoplePresenter = PeoplePresenter(peopleInteractor: getPeopleInteractor())
        }
        return peoplePresenter!
    }

    func getPeopleInteractor() -> IPeopleInteractor {
        if (peopleInteractor == nil) {
            peopleInteractor = PeopleInteractor(peopleRepository: getPeopleRepository())
        }
        return peopleInteractor!
    }

    func getPeopleRepository() -> IPeopleRepository {
        if (peopleRepository == nil) {
            peopleRepository = PeopleRepository(
                    peopleServiceDataSource: getPeopleRemoteDataSource(),peopleBaseDataSource: getPeopleBaseDataSource())
        }
        return peopleRepository!
    }

    func getPeopleBaseDataSource() -> IPeopleLocalDataSource {
        if (peopleLocalDataSource == nil) {
            peopleLocalDataSource = PeopleBaseDataSource()
        }
        return peopleLocalDataSource!
    }

    func getPeopleRemoteDataSource() -> IPeopleRemoteDataSource {
        if (peopleServiceDataSource == nil) {
            peopleServiceDataSource = PeopleServiceDataSource()
        }
        return peopleServiceDataSource!
    }
}