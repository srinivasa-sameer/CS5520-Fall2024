//
//  ContactView.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class ContactView: UIView {

    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var addressLabel: UILabel!
    var address: UILabel!
    var citystate: UILabel!
    var zipcode: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupLabels()
        initConstraints()
        
    }
    
    func setupLabels(){
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(name)
        
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
        
        phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phone)
        
        addressLabel = UILabel()
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = "Address:"
        addressLabel.font =  UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(addressLabel)
        
        address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
        
        citystate = UILabel()
        citystate.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(citystate)
        
        zipcode = UILabel()
        zipcode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zipcode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 12),
            phone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 20),
            addressLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            address.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 12),
            address.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            citystate.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 12),
            citystate.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            zipcode.topAnchor.constraint(equalTo: citystate.bottomAnchor, constant: 12),
            zipcode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }

}
