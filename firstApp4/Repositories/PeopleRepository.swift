//
//  PeopleDataSource.swift
//  firstApp4
//
//  Created by Александр Студенецкий on 09/12/2019.
//  Copyright © 2019 Александр Студенецкий. All rights reserved.
//

import Foundation

class PeopleRepository: IPeopleRepository{
    let peopleServiceDataSource: IPeopleRemoteSource
    let peopleBaseDataSource: IPeopleLocalDataSource
    
    init(peopleServiceDataSource: IPeopleRemoteSource, peopleBaseDataSource: IPeopleLocalDataSource) {
        self.peopleServiceDataSource = peopleServiceDataSource
        self.peopleBaseDataSource = peopleBaseDataSource
    }
    
    func getPeople(firstName: String, secondName: String) -> String? {
        let resultFromBase = peopleBaseDataSource.getPeople(firstName: firstName, secondName: secondName)
        if (resultFromBase != nil) {
            return resultFromBase
        } else {
            let resultFromService = peopleServiceDataSource.getPeople(firstName: firstName, secondName: secondName)
            if (resultFromService != nil) {
                peopleBaseDataSource.savePeople(firstName: firstName, secondName: secondName, result: resultFromService!)
            }

            return peopleServiceDataSource.getPeople(firstName: firstName, secondName: secondName)
        }
    }
    
}
