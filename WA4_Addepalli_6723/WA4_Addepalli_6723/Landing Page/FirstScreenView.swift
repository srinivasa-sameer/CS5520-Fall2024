//
//  FirstScreenView.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class FirstScreenView: UIView {

    var tableViewContact : UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupTableViewContacts()
        initConstraints()
    }
    
    func setupTableViewContacts(){
        tableViewContact = UITableView()
        tableViewContact.register(TableViewContactCell.self, forCellReuseIdentifier: "contacts")
        tableViewContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewContact)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewContact.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewContact.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewContact.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
