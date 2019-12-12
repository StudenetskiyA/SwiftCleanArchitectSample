//
//  IPeopleDataSource.swift
//  firstApp4
//
//  Created by Александр Студенецкий on 09/12/2019.
//  Copyright © 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import RxSwift

protocol IPeopleRemoteDataSource {
    
    func getPeople(firstName: String, secondName: String) -> Observable<String>


}
