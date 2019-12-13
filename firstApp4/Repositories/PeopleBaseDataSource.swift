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
    let tag = AppDelegate.tag + "/PeopleDBDataSource"

    let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func getPeople(firstName: String, secondName: String) -> Observable<String> {
        Observable.create({ observer -> Disposable in
            let predicate = NSPredicate(format: "firstName = %@ AND lastName = %@", firstName, secondName)
            let users = self.realm.objects(People.self).filter(predicate)
            if (users.count > 0) {
                Log.d(moduleName: self.tag, message: "Get from base " + users[0].email)
                observer.onNext(users[0].email)
            } else {
                Log.d(moduleName: self.tag, message: "Not found in base " + firstName + "/" + secondName)
                observer.onError(NSError(domain: "Realm", code: 404, userInfo: nil))
            }
            return Disposables.create {
            }
        })
    }

    func savePeople(firstName: String, secondName: String, result: String) {
        Log.d(moduleName: self.tag, message: "Save in database " + result)

        let user = People()
        user.setUp(firstName: firstName, lastName: secondName, email: result)
        do {
            try realm.write {
                realm.add(user)
            }
        } catch {
        }
    }

}
