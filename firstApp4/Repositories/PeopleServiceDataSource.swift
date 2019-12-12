//
//  PeopleServiceDataSource.swift
//  firstApp4
//
//  Created by Александр Студенецкий on 09/12/2019.
//  Copyright © 2019 Александр Студенецкий. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import Gloss

class PeopleServiceDataSource: IPeopleRemoteDataSource {

    func getPeople(firstName: String, secondName: String) -> Observable<String> {
        //Сервер реально работающий, но ответ я подменяю фэйковым.
        let fakeJSON: [String: Any] = [
            "email": "\(firstName)@\(secondName).ru"
        ]

        return Observable.create({ observer -> Disposable in
            request("https://reqres.in/api/users/2", method: .get).validate().responseJSON { responseJSON in
                switch responseJSON.result {
                case .success(let value):
                    guard let json = fakeJSON as? JSON,
                          let responseModel = GetResult(json: json) else {
                        observer.onError(NSError(domain: "", code: 1, userInfo: nil))
                        return
                    }

                    observer.onNext(responseModel.email)
                case .failure(let error):
                    //Не понимаю, как извлечь полезную информацию из error
                    observer.onError(NSError(domain: "", code: 0, userInfo: nil))
                }
            }
            return Disposables.create {
            }
        })
    }
}

struct GetResult: Decodable {
    public let email: String

    public init?(json: JSON) {
        guard let email: String = "email" <~~ json else {
            print("email unwrapping failed in guard")
            return nil
        }

        self.email = email
    }
}