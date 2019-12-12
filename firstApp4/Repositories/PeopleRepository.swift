//
//  PeopleDataSource.swift
//  firstApp4
//
//  Created by Александр Студенецкий on 09/12/2019.
//  Copyright © 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import RxSwift

class PeopleRepository: IPeopleRepository {
    let tag = App.tag + "/PeopleRepository"
    let peopleServiceDataSource: IPeopleRemoteDataSource
    let peopleBaseDataSource: IPeopleLocalDataSource

    init(peopleServiceDataSource: IPeopleRemoteDataSource, peopleBaseDataSource: IPeopleLocalDataSource) {
        self.peopleServiceDataSource = peopleServiceDataSource
        self.peopleBaseDataSource = peopleBaseDataSource
    }

    func getPeople(firstName: String, secondName: String) -> Observable<String> {
        //Если бы не надо было сохранять в базу после получения от сервера, можно еще короче написать.
//        self.peopleBaseDataSource.getPeople(firstName: firstName, secondName: secondName).catchError { error in
//            self.peopleServiceDataSource.getPeople(firstName: firstName, secondName: secondName)
//        }

        Observable.create({ observer -> Disposable in
            self.peopleBaseDataSource.getPeople(firstName: firstName, secondName: secondName).subscribe(onNext: { (event) in
                Log.d(moduleName: self.tag, message: "Get from base " + event)
                observer.onNext(event)
            }, onError: { (event) in
                Log.d(moduleName: self.tag, message: "Not found in base, event = \(event) , try get from service")
                self.peopleServiceDataSource.getPeople(firstName: firstName, secondName: secondName).subscribe(onNext: { (event) in
                    Log.d(moduleName: self.tag, message: "Save in database " + event)
                    self.peopleBaseDataSource.savePeople(firstName: firstName, secondName: secondName, result: event)
                    observer.onNext(event)
                }, onError: { (event) in
                    Log.d(moduleName: self.tag, message: "Error from service, event = \(event)")
                })
            })
            return Disposables.create {
            }
        })
    }
}
