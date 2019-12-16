//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import UIKit

class PeoplePresenter : IPeoplePresenter{
    let tag = AppDelegate.tag + "/Presenter"

    var peopleView: IPeopleView?
    let peopleInteractor: IPeopleInteractor
    let logInteractor: ILogInteractor

    init(peopleInteractor: IPeopleInteractor, logInteractor: ILogInteractor) {
        self.peopleInteractor = peopleInteractor
        self.logInteractor = logInteractor
    }

    func clearLog() {
        logInteractor.clearLog()
        showLog()
    }

    func showLog() {
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
            Log.d(moduleName: self.tag, message: "error = \(error)")
        }, onCompleted: {
            Log.d(moduleName: self.tag, message: "View log pressed")
        })
    }

    func refreshUI(info: String) {
        peopleView?.setInfoToView(data: info)
    }

    func textFieldDidChange(senderName: String, senderLastName: String) {
        //Мацюк в своих видео говорит выносить такие вещи в интерактор, но я не уверен, что это именно бизнес-логика. Обсуждаемо.
        if (senderName.count > 2 && senderLastName.count > 2) {
            peopleView?.setFindButtonEnabled(enable: true)
        } else {
            peopleView?.setFindButtonEnabled(enable: false)
        }
    }
}