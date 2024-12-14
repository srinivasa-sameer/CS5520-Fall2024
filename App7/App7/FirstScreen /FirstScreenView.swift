//
//  FirstScreenView.swift
//  App7
//
//  Created by Srinivasa Sameer Addepalli on 10/21/24.
//

import UIKit

class FirstScreenView: UIView {
    var buttonFetch: UIButton!
    var labelReceivedText: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setUpButtonFetch()
        setUpLabelReceivedText()

        initConstraints()
    }
    
    func setUpButtonFetch(){
        buttonFetch = UIButton(type: .system)
        buttonFetch.setTitle("Fetch Text from Second Screen", for: .normal)
        buttonFetch.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonFetch)
    }
    
    func setUpLabelReceivedText(){
        labelReceivedText = UILabel()
        labelReceivedText.text = "Will Receive Text from Second Screen"
        labelReceivedText.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelReceivedText)
    }
    
    func initConstraints(){
            NSLayoutConstraint.activate([
                buttonFetch.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
                buttonFetch.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                labelReceivedText.topAnchor.constraint(equalTo: buttonFetch.bottomAnchor, constant: 32),
                labelReceivedText.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            ])
        }
    
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
