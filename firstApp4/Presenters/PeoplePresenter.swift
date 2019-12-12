//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class PeoplePresenter : IPeoplePresenter{
    var peopleView: IPeopleView?
    let peopleInteractor: IPeopleInteractor

    init(peopleInteractor: IPeopleInteractor) {
        self.peopleInteractor = peopleInteractor
    }

    func bindView(view: IPeopleView) {
        peopleView = view
    }

    func unbindView() {
        peopleView = nil
    }


    func getPeople(firstName: String, secondName: String) {
        _ = peopleInteractor.getPeople(firstName: firstName, secondName: secondName).subscribe(onNext: { (event) in
            print(event)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("finish")
        })
    }

    func refreshUI(info: String) {
        peopleView?.setInfoToView(data: info)
    }

}