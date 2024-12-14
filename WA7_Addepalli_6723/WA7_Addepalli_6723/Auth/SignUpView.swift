//
//  SignUpView.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import UIKit

class SignUpView: UIView {
    var name: UITextField!
    var email: UITextField!
    var password: UITextField!
    var signUpButton: UIButton!
    var title: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupTextFields()
        setupSignUpButton()
        setupTitleLabel()
        setupConstraints()
    }

    func setupTextFields() {
        name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)

        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)

        password = UITextField()
        password.placeholder = "Password"
        password.borderStyle = .roundedRect
        password.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(password)
    }

    func setupSignUpButton() {
        signUpButton = UIButton(type: .system)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(signUpButton)
    }

    func setupTitleLabel() {
        title = UILabel()
        title.text = "Sign Up"
        title.font = .boldSystemFont(ofSize: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),

            name.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            name.topAnchor.constraint(
                equalTo: title.bottomAnchor, constant: 40),
            name.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -20),

            email.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            email.topAnchor.constraint(
                equalTo: name.bottomAnchor, constant: 20),
            email.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 20),
            email.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -20),

            password.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            password.topAnchor.constraint(
                equalTo: email.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 20),
            password.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -20),

            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpButton.topAnchor.constraint(
                equalTo: password.bottomAnchor, constant: 40),
            signUpButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -20),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
