//
// Created by Александр Студенецкий on 12.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import RealmSwift

class People : Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""

//    init(firstName: String, lastName: String, email:String) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//    }

    required init() {}
}
