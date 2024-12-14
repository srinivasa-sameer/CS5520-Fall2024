//
//  SecondScreenViewController.swift
//  App7
//
//  Created by Srinivasa Sameer Addepalli on 10/21/24.
//

import UIKit

class SecondScreenViewController: UIViewController {
    let secondScreen = SecondScreenView()
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = secondScreen
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second Screen"
        
        secondScreen.buttonSendBack.addTarget(self, action: #selector(onButtonSendBackTapped), for: .touchUpInside)
        
    }
    
    @objc func onButtonSendBackTapped(){
        if let text = secondScreen.textFieldSendBack.text{
            //MARK: posting text to NotificationCenter...
            notificationCenter.post(
                name: .textFromSecondScreen,
                object: text)
            navigationController?.popViewController(animated: true)
        }else{
            //Alert invalid input...
        }
        
    }

}
