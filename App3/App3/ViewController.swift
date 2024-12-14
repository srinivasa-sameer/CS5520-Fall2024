//
//  ViewController.swift
//  App3
//
//  Created by Srinivasa Sameer Addepalli on 9/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    var textFieldMessage: UITextField!
    var buttonSend: UIButton!
    var labelMood: UILabel!
    var imageMood: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "nLearning Navigation"
        // Do any additional setup after loading the view.
        
        setupTextFieldMessage()
        setupButtonSend()
        
        setupLabelMood()
        setupImageMood()
        
        initConstraints()
        
        buttonSend.addTarget(self, action: #selector(onButtonSendClicked), for: .touchUpInside)
    }
    
    func setupTextFieldMessage() {
        textFieldMessage = UITextField()
        textFieldMessage.placeholder = "Enter your message here"
        textFieldMessage.borderStyle = .roundedRect
        textFieldMessage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldMessage)
    }
    
    func setupButtonSend() {
        buttonSend = UIButton(type: .system)
        buttonSend.setTitle("Send", for: .normal)
        buttonSend.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSend)
    }
    
    func setupLabelMood(){
        labelMood = UILabel()
        labelMood.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelMood)
    }
    
    func setupImageMood(){
        imageMood = UIImageView()
        imageMood.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageMood)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            //textFieldMessage constraints
            textFieldMessage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textFieldMessage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            //ButtonSend contraints|
            buttonSend.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonSend.topAnchor.constraint(equalTo: textFieldMessage.bottomAnchor, constant: 16),
            
            //labelMood constraints
            labelMood.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelMood.topAnchor.constraint(equalTo: buttonSend.bottomAnchor, constant: 16),
            
            //imageMood constraints
            imageMood.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageMood.topAnchor.constraint(equalTo: labelMood.bottomAnchor, constant: 16),
            
            
        ])
    }
    
    @objc func onButtonSendClicked() {
        var showViewController = ShowViewController()
        
        if let unwrappedMessage = textFieldMessage.text {
            if !unwrappedMessage.isEmpty {
                showViewController.messageFromFirstScreen = unwrappedMessage
            }else{
                showAlertController()
            }
            showViewController.delegate = self
        }
        navigationController?.pushViewController(showViewController, animated: true)
    }
    
    func delegateButtonSendMood(mood: String){
        print("The user is \(mood)")
        imageMood.image = UIImage(named: mood.lowercased())
    }
    
    func showAlertController() {
        let alertController = UIAlertController(title: "Error", message: "Please enter a message", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

