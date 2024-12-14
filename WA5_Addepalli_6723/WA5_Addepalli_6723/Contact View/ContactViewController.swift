//
//  ContactViewController.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class ContactViewController: UIViewController {

    let contactView = ContactView()
    var contact: Contact!
    var contactIndex: Int!
    
    var delegate:ViewController!
    
    override func loadView() {
        view = contactView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self,
            action: #selector(onEditBarButtonTapped)
        )
        
        setupFields()
    }
    
    @objc func onEditBarButtonTapped(){
        let addContactViewController = AddContactViewController()
        addContactViewController.editContact(contactIndex, contact)
        addContactViewController.delegate = delegate
        addContactViewController.pickedImage = contact.image
        var viewControllers = navigationController?.viewControllers ?? []
        if let index = viewControllers.lastIndex(where: { $0 is ContactViewController }){
            viewControllers[index] = addContactViewController
        }
        navigationController?.setViewControllers(viewControllers, animated: true)

    }
    
    func setupFields(){
        contactView.imageContact.image = contact.image
        contactView.name.text = "\(contact.name!)"
        contactView.email.text = "Email: \(contact.email!)"
        contactView.phone.text = "Phone: \(contact.phoneNumber!) (\(contact.phoneType!))"
        contactView.address.text = "\(contact.address!)"
        contactView.citystate.text = "\(contact.citystate!)"
        contactView.zipcode.text = "\(contact.zipcode!)"
    }

}
