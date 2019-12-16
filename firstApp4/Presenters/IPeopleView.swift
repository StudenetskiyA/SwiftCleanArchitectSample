//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

protocol IPeopleView {

    func searchPeople()

    func setInfoToView(data: String) //Вообще, здесь надо дата-модель

    func setFindButtonEnabled(enable: Bool)
}