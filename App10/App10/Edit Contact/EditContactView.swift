//
//  EditContactView.swift
//  App10
//
//  Created by Srinivasa Sameer Addepalli on 10/23/24.
//

import UIKit

class EditContactView: UIView {

    var contentWrapper: UIScrollView!
    var name: UITextField!
    var email: UITextField!
    var phone: UITextField!
    var saveButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white

        setUpContentWrapper()
        setUpTextFields()
        setUpSaveButton()
        initConstraints()

    }

    func setUpContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }

    func setUpTextFields() {
        name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(name)

        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(email)

        phone = UITextField()
        phone.placeholder = "Phone number"
        phone.borderStyle = .roundedRect
        phone.keyboardType = .phonePad
        phone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(phone)
    }

    func setUpSaveButton() {
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(saveButton)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([

            contentWrapper.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.heightAnchor),

            name.topAnchor.constraint(
                equalTo: contentWrapper.topAnchor, constant: 18),
            name.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),
            name.widthAnchor.constraint(equalToConstant: 300),

            email.topAnchor.constraint(
                equalTo: name.bottomAnchor, constant: 18),
            email.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),
            email.widthAnchor.constraint(equalToConstant: 300),

            phone.topAnchor.constraint(
                equalTo: email.bottomAnchor, constant: 18),
            phone.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),
            phone.widthAnchor.constraint(equalToConstant: 300),

            saveButton.topAnchor.constraint(
                equalTo: phone.bottomAnchor, constant: 15),
            saveButton.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),
            saveButton.bottomAnchor.constraint(
                equalTo: contentWrapper.bottomAnchor),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
