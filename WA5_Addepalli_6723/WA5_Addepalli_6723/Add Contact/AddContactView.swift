//
//  AddContactView.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class AddContactView: UIView {
    var name: UITextField!
    var email: UITextField!
    var phone:UITextField!
    var address: UITextField!
    var citystate: UITextField!
    var zipcode: UITextField!
    
    var buttonTakePhoto: UIButton!
    var buttonSelectType: UIButton!
    var saveButton: UIButton!
    var photoTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        
        setupName()
        setupEmail()
        setupPhone()
        setupAddress()
        setupCityState()
        setupZipcode()
        setupbuttonTakePhoto()
        setupbuttonSelectType()
        setupSaveButton()
        setupPhotoLabel()
        initConstraints()
        
    }
    
    func setupName(){
        name = UITextField()
        name.placeholder = "Name"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.borderStyle = .roundedRect
        self.addSubview(name)
    }
    
    
    func setupPhotoLabel(){
        photoTitle = UILabel()
        photoTitle.translatesAutoresizingMaskIntoConstraints = false
        photoTitle.text = "Photo"
        photoTitle.font = UIFont.systemFont(ofSize: 24)
        photoTitle.textColor = UIColor.darkGray
        self.addSubview(photoTitle)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.tintColor = .black
        self.addSubview(buttonTakePhoto)
    }
    

    func setupEmail(){
        email = UITextField()
        email.placeholder = "Email"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        self.addSubview(email)
    }
    
    func setupbuttonSelectType(){
        buttonSelectType = UIButton(type: .system)
        buttonSelectType.setTitle(Utilities.phoneTypes[0], for: .normal)
        buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
        buttonSelectType.showsMenuAsPrimaryAction = true
        self.addSubview(buttonSelectType)
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
    
    func setupSaveButton(){
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(saveButton)
    }
    
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            name.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            
            photoTitle.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 12),
            photoTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            email.topAnchor.constraint(equalTo: photoTitle.bottomAnchor, constant: 12),
            email.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            email.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 12),
            phone.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            phone.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -80),
            
            buttonSelectType.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 12),
            buttonSelectType.leadingAnchor.constraint(equalTo: phone.trailingAnchor, constant: 8),
            buttonSelectType.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            address.topAnchor.constraint(equalTo: buttonSelectType.bottomAnchor, constant: 12),
            address.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            address.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            citystate.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 12),
            citystate.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            citystate.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            zipcode.topAnchor.constraint(equalTo: citystate.bottomAnchor, constant: 12),
            zipcode.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            zipcode.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            
            saveButton.topAnchor.constraint(equalTo: zipcode.bottomAnchor, constant: 12),
            saveButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
