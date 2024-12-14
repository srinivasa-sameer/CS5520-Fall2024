//
//  ViewController.swift
//  App4
//
//  Created by Srinivasa Sameer Addepalli on 9/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: initializing the First Screen View...
    let firstScreen = FirstScreenView()
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

