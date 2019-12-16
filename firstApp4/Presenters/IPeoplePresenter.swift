//
// Created by Александр Студенецкий on 10.12.2019.
// Copyright (c) 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import UIKit

protocol IPeoplePresenter {

    func getPeople(firstName: String, secondName: String)

    func clearLog()

    func showLog()

    func bindView(view: IPeopleView)

    func unbindView()

    func textFieldDidChange(senderName: String, senderLastName: String)
}