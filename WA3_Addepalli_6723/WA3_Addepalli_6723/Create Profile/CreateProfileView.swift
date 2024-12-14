//
//  CreateProfileView.swift
//  WA3_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 9/27/24.
//

import UIKit

class CreateProfileView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var titleLabel: UILabel!
    
    var name: UITextField!
    var email: UITextField!
    var addPhoneLabel: UILabel!
    var selectTypeLabel: UILabel!
    var typePicker: UIPickerView!
    var phone: UITextField!
    var address: UITextField!
    var citystate: UITextField!
    var zipcode: UITextField!
    var showProfileButton: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        
        setupTitleLabel()
        setupName()
        setupEmail()
        setupAddPhoneLabel()
        setupSelectTypeLabel()
        setupTypePicker()
        setupPhone()
        setupAddress()
        setupCityState()
        setupZipcode()
        setupShowProfileButton()
        
        initConstraints()
    }
    
    func setupTitleLabel(){
        titleLabel = UILabel()
        titleLabel.text = "Create Profile"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 25)
        self.addSubview(titleLabel)
    }
    
    func setupName(){
        name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
    }
    
    func setupEmail(){
        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
    }
    
    func setupAddPhoneLabel(){
        addPhoneLabel = UILabel()
        addPhoneLabel.text = "Add Phone"
        addPhoneLabel.font = .systemFont(ofSize: 20)
        addPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addPhoneLabel)
    }
    
    func setupSelectTypeLabel(){
        selectTypeLabel = UILabel()
        selectTypeLabel.text = "Select Type:"
        selectTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(selectTypeLabel)
    }
    
    func setupTypePicker(){
        typePicker = UIPickerView()
        typePicker.isUserInteractionEnabled = true
        typePicker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(typePicker)
    }
    
    func setupPhone(){
        phone = UITextField()
        phone.placeholder = "Phone Number"
        phone.borderStyle = .roundedRect
        phone.keyboardType = .phonePad
        phone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phone)
    }
    
    func setupAddress(){
        address = UITextField()
        address.placeholder = "Address"
        address.borderStyle = .roundedRect
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }
    
    func setupCityState(){
        citystate = UITextField()
        citystate.placeholder = "City, State"
        citystate.borderStyle = .roundedRect
        citystate.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(citystate)
    }
    
    func setupZipcode(){
        zipcode = UITextField()
        zipcode.placeholder = "ZIP"
        zipcode.borderStyle = .roundedRect
        zipcode.keyboardType = .numberPad
        zipcode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zipcode)
    }
    
    func setupShowProfileButton(){
        showProfileButton = UIButton(type: .system)
        showProfileButton.setTitle("Show Profile", for: .normal)
        showProfileButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(showProfileButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 26),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:25),
            name.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -25),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            email.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:25),
            email.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -25),
            
            addPhoneLabel.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 18),
            addPhoneLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            selectTypeLabel.topAnchor.constraint(equalTo: addPhoneLabel.bottomAnchor, constant: 12),
            selectTypeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            typePicker.topAnchor.constraint(equalTo: selectTypeLabel.bottomAnchor, constant: 6),
            typePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phone.topAnchor.constraint(equalTo: typePicker.bottomAnchor, constant: 12),
            phone.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:25),
            phone.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -25),
            
            address.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 12),
            address.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:25),
            address.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -25),
            
            citystate.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 12),
            citystate.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:25),
            citystate.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -25),
            
            zipcode.topAnchor.constraint(equalTo: citystate.bottomAnchor, constant: 12),
            zipcode.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:25),
            zipcode.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -25),
            
            showProfileButton.topAnchor.constraint(equalTo: zipcode.bottomAnchor, constant: 25),
            showProfileButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
