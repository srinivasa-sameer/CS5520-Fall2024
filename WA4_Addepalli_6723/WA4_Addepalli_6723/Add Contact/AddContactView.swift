//
//  AddContactView.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class AddContactView: UIView {
    var screenLabel: UILabel!
    var name: UITextField!
    var email: UITextField!
    var addPhoneLabel: UILabel!
    var cellTypePicker: UIPickerView!
    var phone:UITextField!
    var address: UITextField!
    var citystate: UITextField!
    var zipcode: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupLabelAppName()
        setupName()
        setupEmail()
        setupAddPhone()
        setupCellTypePicker()
        setupPhone()
        setupAddress()
        setupCityState()
        setupZipcode()
        initConstraints()
        
    }
    
    func setupLabelAppName(){
        screenLabel = UILabel()
        screenLabel.text = "Add a New Contact"
        screenLabel.translatesAutoresizingMaskIntoConstraints = false
        screenLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(screenLabel)
    }
    
    func setupName(){
        name = UITextField()
        name.placeholder = "Name"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.borderStyle = .roundedRect
        self.addSubview(name)
    }
    
    func setupEmail(){
        email = UITextField()
        email.placeholder = "Email"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        self.addSubview(email)
    }
    
    func setupAddPhone(){
        addPhoneLabel = UILabel()
        addPhoneLabel.text = "Add Phone"
        addPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addPhoneLabel)
    }
    
    func setupCellTypePicker(){
        cellTypePicker = UIPickerView()
        cellTypePicker.isUserInteractionEnabled = true
        cellTypePicker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cellTypePicker)
    }
    
    func setupPhone(){
        phone = UITextField()
        phone.placeholder = "Phone number"
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.borderStyle = .roundedRect
        phone.keyboardType = .phonePad
        self.addSubview(phone)
    }
    
    func setupAddress(){
        address = UITextField()
        address.placeholder = "Address"
        address.translatesAutoresizingMaskIntoConstraints = false
        address.borderStyle = .roundedRect
        self.addSubview(address)
    }
    
    func setupCityState(){
        citystate = UITextField()
        citystate.placeholder = "City, State"
        citystate.translatesAutoresizingMaskIntoConstraints = false
        citystate.borderStyle = .roundedRect
        self.addSubview(citystate)
    }
    
    func setupZipcode(){
        zipcode = UITextField()
        zipcode.placeholder = "ZIP Code"
        zipcode.translatesAutoresizingMaskIntoConstraints = false
        zipcode.borderStyle = .roundedRect
        zipcode.keyboardType = .numberPad
        self.addSubview(zipcode)
    }
    
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            screenLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            screenLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: screenLabel.bottomAnchor, constant: 12),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            name.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            email.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            email.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            addPhoneLabel.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 18),
            addPhoneLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            cellTypePicker.topAnchor.constraint(equalTo: addPhoneLabel.bottomAnchor, constant: -40),
            cellTypePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phone.topAnchor.constraint(equalTo: cellTypePicker.bottomAnchor, constant: 12),
            phone.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            phone.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            address.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 12),
            address.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            address.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            citystate.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 12),
            citystate.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            citystate.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            zipcode.topAnchor.constraint(equalTo: citystate.bottomAnchor, constant: 12),
            zipcode.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            zipcode.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
