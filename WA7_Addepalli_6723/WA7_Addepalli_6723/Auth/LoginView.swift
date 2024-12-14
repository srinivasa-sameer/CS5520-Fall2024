//
//  LoginView.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import UIKit

class LoginView: UIView {
    var email: UITextField!
    var password: UITextField!
    var loginButton: UIButton!
    var signUpButton: UIButton!
    var title: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupTextFields()
        setupButtons()
        setupTitleLabel()
        initConstraints()
    }

    func setupTextFields() {
        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)

        password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.borderStyle = .roundedRect
        password.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(password)
    }

    func setupButtons() {
        loginButton = UIButton(type: .system)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .black
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginButton)

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
        title.text = "Login"
        title.font = .boldSystemFont(ofSize: 26)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),

            email.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            email.topAnchor.constraint(equalTo: title.topAnchor, constant: 100),
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

            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.topAnchor.constraint(
                equalTo: password.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(
                equalTo: self.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(
                equalTo: self.trailingAnchor, constant: -20),

            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpButton.topAnchor.constraint(
                equalTo: loginButton.bottomAnchor, constant: 20),
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
