//
//  ContactDetailsViewController.swift
//  App10
//
//  Created by Srinivasa Sameer Addepalli on 10/24/24.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    let contactDetailsView = ContactDetailsView()
    var contact: Contact!
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = contactDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact Details"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(onEditButtonTapped))
        
        notificationCenter.addObserver(self, selector: #selector(editContactNotification(notification:)),
                                       name: .edit, object: nil)
        
        setContactFields()
        contactDetailsView.deleteButton.addTarget(self, action: #selector(onButtonDeletedTapped), for: .touchUpInside)
    }
    
    @objc func editContactNotification(notification: Notification) {
        let obj = notification.object as? EditNotification
        contact = obj?.contact
        if let contact = contact{
            contactDetailsView.name.text = "Name: \(contact.name)"
            contactDetailsView.email.text = "Email: \(contact.email)"
            contactDetailsView.phone.text = "Phone: \(contact.phone)"
        }
    }
    
    @objc func onEditButtonTapped() {
        let editContactViewController = EditContactViewController()
        editContactViewController.contact = contact
        navigationController?.pushViewController(editContactViewController, animated: true)
    }
    
    @objc func onButtonDeletedTapped() {
        let alert = UIAlertController(title: "Delete Contact", message: "Are you sure you want to delete this contact?", preferredStyle: .alert)
            
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.notificationCenter.post(name: .delete, object: self.contact.name)
            self.navigationController?.popViewController(animated: true)
        })

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func setContactFields() {
        if let contact = contact{
            contactDetailsView.name.text = "Name: \(contact.name)"
            contactDetailsView.email.text = "Email: \(contact.email)"
            contactDetailsView.phone.text = "Phone: \(contact.phone)"
        }
    }

}
