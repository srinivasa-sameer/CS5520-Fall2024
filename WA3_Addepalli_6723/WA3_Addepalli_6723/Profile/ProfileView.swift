//
//  ProfileView.swift
//  WA3_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 9/27/24.
//

import UIKit

class ProfileView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var address: UILabel!
    var citystate: UILabel!
    var zipcode: UILabel!
    var phoneImage: UIImageView!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupLabels()
        setupPhoneImage()
        
        initConstraints()
    }
    
    func setupLabels(){
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
        
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
        
        phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phone)
        
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
    
    func setupPhoneImage(){
        phoneImage = UIImageView()
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            email.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),

            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 12),
            phone.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            
            address.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 12),
            address.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            
            citystate.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 12),
            citystate.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            
            zipcode.topAnchor.constraint(equalTo: citystate.bottomAnchor, constant: 12),
            zipcode.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant:30),
            
            phoneImage.topAnchor.constraint(equalTo: zipcode.bottomAnchor, constant: 20),
            phoneImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
        
    
}
