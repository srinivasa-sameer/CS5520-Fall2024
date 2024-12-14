//
//  ContactDetailsView.swift
//  App10
//
//  Created by Srinivasa Sameer Addepalli on 10/24/24.
//

import UIKit

class ContactDetailsView: UIView {
    var contentWrapper: UIScrollView!
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var deleteButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupContentWrapper()
        setupLabels()
        setupDeleteButton()

        initConstraints()

    }

    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }

    func setupLabels() {
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 22)
        contentWrapper.addSubview(name)

        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(email)

        phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(phone)
    }

    func setupDeleteButton() {
        deleteButton = UIButton(type: .system)
        deleteButton.setTitle("Delete Contact", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(deleteButton)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

            email.topAnchor.constraint(
                equalTo: name.bottomAnchor, constant: 18),
            email.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),

            phone.topAnchor.constraint(
                equalTo: email.bottomAnchor, constant: 18),
            phone.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),

            deleteButton.topAnchor.constraint(
                equalTo: phone.bottomAnchor, constant: 18),
            deleteButton.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),

            deleteButton.bottomAnchor.constraint(
                equalTo: contentWrapper.bottomAnchor),
        ])
    }
}
