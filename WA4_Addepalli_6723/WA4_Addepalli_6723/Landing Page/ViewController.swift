//
//  ViewController.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    let firstScreen = FirstScreenView()
    var contacts = [Contact]()
    
    override func loadView() {
        view = firstScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonClicked))
        
        firstScreen.tableViewContact.delegate = self
        firstScreen.tableViewContact.dataSource = self
        firstScreen.tableViewContact.separatorStyle = .none
        firstScreen.tableViewContact.separatorColor = .clear
    }
    
    func delegateOnAddContact(contact: Contact){
        contacts.append(contact)
        firstScreen.tableViewContact.reloadData()
    }
    
    @objc func onAddBarButtonClicked(){
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactCell
        cell.labelName.text = contacts[indexPath.row].name
        cell.labelEmail.text = contacts[indexPath.row].email
        if let phoneNumber = contacts[indexPath.row].phoneNumber, let cellType = contacts[indexPath.row].phoneType{
            cell.labelPhone.text = "\(phoneNumber) (\(cellType))"
        }
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactView = ContactViewController()
        contactView.contact = contacts[indexPath.row]
        navigationController?.pushViewController(contactView, animated: true)
        firstScreen.tableViewContact.deselectRow(at: indexPath, animated: true)
    }
    
}

