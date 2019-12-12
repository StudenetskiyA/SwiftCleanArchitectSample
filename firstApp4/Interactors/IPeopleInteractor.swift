//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import RxSwift

protocol IPeopleInteractor {

    func getPeople(firstName: String, secondName: String) -> Observable<String>

}