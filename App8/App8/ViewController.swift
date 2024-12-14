//
//  ViewController.swift
//  App8
//
//  Created by Srinivasa Sameer Addepalli on 10/21/24.
//

import UIKit

class ViewController: UIViewController {

    let homeScreen = ScrollScreenView()

    override func loadView() {
        view = homeScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: hide Keyboard on tapping the screen...
        hideKeyboardOnTapOutside()
    }

    //MARK: hide keyboard logic...
    func hideKeyboardOnTapOutside() {
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }

    @objc func hideKeyboardOnTap() {
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
}
