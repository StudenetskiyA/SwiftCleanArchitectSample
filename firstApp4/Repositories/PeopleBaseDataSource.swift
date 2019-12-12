//
//  PeopleBaseDataSource.swift
//  firstApp4
//
//  Created by Александр Студенецкий on 09/12/2019.
//  Copyright © 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class PeopleBaseDataSource: IPeopleLocalDataSource {
    func getPeople(firstName: String, secondName: String) -> Observable<String> {
        //return Observable<String>.just("from base")
        Observable.create({ observer -> Disposable in
            observer.onError(NSError(domain: "", code: 404, userInfo: nil))
            return Disposables.create {
            }
        })
    }

    func savePeople(firstName: String, secondName: String, result: String) {

    }

}
