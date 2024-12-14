//
//  ViewController.swift
//  App7
//
//  Created by Srinivasa Sameer Addepalli on 10/21/24.
//

import UIKit

class ViewController: UIViewController {

    let firstScreen = FirstScreenView()
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First Screen"
        
        //MARK: buttonSend target...
        firstScreen.buttonFetch.addTarget(self, action: #selector(onButtonFetchTapped), for: .touchUpInside)
        
        //MARK: observing text if it is updated in NotificationCenter...
        //MARK: observing text if it is updated in NotificationCenter...
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedForTextChanged(notification:)),
            name: .textFromSecondScreen,
            object: nil)
    }
    
    @objc func onButtonFetchTapped(){
        let secondScrren = SecondScreenViewController()
        navigationController?.pushViewController(secondScrren, animated: true)
    }
    
    @objc func notificationReceivedForTextChanged(notification: Notification){
        firstScreen.labelReceivedText.text = (notification.object as! String)
    }
}
