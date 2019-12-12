//
//  ViewController.swift
//  firstApp4
//
//  Created by Александр Студенецкий on 09/12/2019.
//  Copyright © 2019 Александр Студенецкий. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, IPeopleView {
    let app = App()
    var peoplePresenter: IPeoplePresenter?

    @IBOutlet var resultsTextView: UITextView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        peoplePresenter = app.getPeoplePresenter()
        peoplePresenter?.bindView(view: self)

    }

    @IBAction func okButtonPressed(sender: AnyObject) {
        print("Button pressed")
        var configuration = Realm.Configuration(
                schemaVersion: 1
//                migrationBlock: { migration, oldSchemaVersion in
//                    if oldSchemaVersion < 1 {
//
//                        // if just the name of your model's property changed you can do this
//                        migration.renameProperty(onType: NotSureItem.className(), from: "text", to: "title")
//
//                        // if you want to fill a new property with some values you have to enumerate
//                        // the existing objects and set the new value
//                        migration.enumerateObjects(ofType: NotSureItem.className()) { oldObject, newObject in
//                            let text = oldObject!["text"] as! String
//                            newObject!["textDescription"] = "The title is \(text)"
//                        }
//
//                        // if you added a new property or removed a property you don't
//                        // have to do anything because Realm automatically detects that
//                    }
//                }
        )
        Realm.Configuration.defaultConfiguration = configuration
        let uiRealm = try! Realm()
//        let people = People()
//        people.firstName = "alex"
//        people.lastName = "inbox"
//        people.email = "mail@mail.ru"
//        do {
//            try uiRealm.write { () -> Void in
//                uiRealm.add(people)
//            }
//        } catch {
//        }
       // let aPredicate = NSPredicate(format: "color = %@ AND name BEGINSWITH %@", "red", "BMW")
        let predicate = NSPredicate(format: "firstName = %@ AND lastName = %@", "alex","inbox")
        let users = uiRealm.objects(People.self).filter(predicate)
        print(users[0].email)

        //searchPeople()
    }

    @IBAction func viewTapped(sender: AnyObject) {
        print("View pressed")
        nameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

    }

    func searchPeople() {
        peoplePresenter?.getPeople(firstName: nameTextField.text!, secondName: passwordTextField.text!)
    }

    func setInfoToView(data: String) {
        resultsTextView.text = data
    }

}

