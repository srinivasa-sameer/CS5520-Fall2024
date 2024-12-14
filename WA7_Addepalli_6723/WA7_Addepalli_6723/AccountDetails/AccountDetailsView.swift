//
//  AccountDetailsView.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import UIKit

class AccountDetailsView: UIView {

    var name: UILabel!
    var email: UILabel!
    var title: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupLabels()
        initConstraints()
    }

    func setupLabels() {
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .systemFont(ofSize: 20, weight: .bold)
        self.addSubview(name)

        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.font = .systemFont(ofSize: 20)
        self.addSubview(email)

        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 30, weight: .bold)
        title.text = "Account Details"
        self.addSubview(title)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),

            name.centerXAnchor.constraint(equalTo: centerXAnchor),
            name.topAnchor.constraint(
                equalTo: title.bottomAnchor, constant: 16),

            email.centerXAnchor.constraint(equalTo: centerXAnchor),
            email.topAnchor.constraint(
                equalTo: name.bottomAnchor, constant: 16),
            email.bottomAnchor.constraint(
                lessThanOrEqualTo: bottomAnchor, constant: -16),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
