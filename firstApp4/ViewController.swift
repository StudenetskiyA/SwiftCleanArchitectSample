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
    let tag = AppDelegate.tag + "/View"

    var app = UIApplication.shared.delegate as! AppDelegate
    lazy var peoplePresenter: IPeoplePresenter = app.peoplePresenter
    lazy var realm: Realm = app.realm

    @IBOutlet var resultsTextView: UITextView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        peoplePresenter.bindView(view: self)
    }

    @IBAction func okButtonPressed(sender: AnyObject) {
        print("Search button pressed")
        searchPeople()
    }

    @IBAction func viewLogButtonPressed(sender: AnyObject) {
        Log.d(moduleName: self.tag, message: "View log pressed")
        peoplePresenter.getLog()
    }

    @IBAction func clearLogButtonPressed(sender: AnyObject) {
        Log.d(moduleName: self.tag, message: "Clear log pressed")
        peoplePresenter.clearLog()
    }

    @IBAction func viewTapped(sender: AnyObject) {
        print("View pressed")
        nameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    func searchPeople() {
        peoplePresenter.getPeople(firstName: nameTextField.text!, secondName: passwordTextField.text!)
    }

    func setInfoToView(data: String) {
        resultsTextView.text = data
    }



}

