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
    
    override func loadView() {
        view = contactView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFields()
    }
    
    func setupFields(){
        contactView.name.text = "\(contact.name!)"
        contactView.email.text = "Email: \(contact.email!)"
        contactView.phone.text = "Phone: \(contact.phoneNumber!) (\(contact.phoneType!))"
        contactView.address.text = "\(contact.address!)"
        contactView.citystate.text = "\(contact.citystate!)"
        contactView.zipcode.text = "\(contact.zipcode!)"
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
