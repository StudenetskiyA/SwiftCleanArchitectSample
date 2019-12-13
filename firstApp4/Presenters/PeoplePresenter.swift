//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class PeoplePresenter : IPeoplePresenter{
    var peopleView: IPeopleView?
    let peopleInteractor: IPeopleInteractor
    let logInteractor: ILogInteractor

    init(peopleInteractor: IPeopleInteractor, logInteractor: ILogInteractor) {
        self.peopleInteractor = peopleInteractor
        self.logInteractor = logInteractor
    }

    func clearLog() {
        logInteractor.clearLog()
        getLog()
    }

    func getLog() {
        refreshUI(info: logInteractor.getLog())
    }

    func bindView(view: IPeopleView) {
        peopleView = view
    }

    func unbindView() {
        peopleView = nil
    }

    func getPeople(firstName: String, secondName: String) {
        _ = peopleInteractor.getPeople(firstName: firstName, secondName: secondName).subscribe(onNext: { (event) in
            self.refreshUI(info: event)
        }, onError: { (error) in
            self.refreshUI(info: error as? String ?? "")
            print(error)
        }, onCompleted: {
            print("finish")
        })
    }

    func refreshUI(info: String) {
        peopleView?.setInfoToView(data: info)
    }

}