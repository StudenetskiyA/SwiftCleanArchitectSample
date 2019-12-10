//
//  ViewController.swift
//  firstApp4
//
//  Created by Александр Студенецкий on 09/12/2019.
//  Copyright © 2019 Александр Студенецкий. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IPeopleView {
    let app = App()
    var peoplePresenter : IPeoplePresenter?

    @IBOutlet var resultsTextView: UITextView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        peoplePresenter = app.getPeoplePresenter()
    }

    @IBAction func okButtonPressed(sender: AnyObject) {
        print("Button pressed")
        searchPeople()
    }

    @IBAction func viewTapped(sender: AnyObject) {
        print("View pressed")
        nameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

    }

    func searchPeople() {
        peoplePresenter?.getPeople(firstName: nameTextField.text!, secondName: passwordTextField.text!)
//        resultsTextView.text = nameTextField.text! + "/" + passwordTextField.text!
    }
}

