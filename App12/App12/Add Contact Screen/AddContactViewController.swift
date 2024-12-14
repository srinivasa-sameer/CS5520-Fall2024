//
//  AddContactViewController.swift
//  App12
//
//  Created by Srinivasa Sameer Addepalli on 11/14/24.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class AddContactViewController: UIViewController {
    let childProgressView = ProgressSpinnerViewController()
    let database = Firestore.firestore()
    var currentUser: FirebaseAuth.User?

    let addContactScreen = AddContactView()

    override func loadView() {
        view = addContactScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Add a New Contact"

        addContactScreen.buttonAdd.addTarget(
            self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }

    //MARK: on add button tapped....
    @objc func onAddButtonTapped() {
        let name = addContactScreen.textFieldName.text
        let email = addContactScreen.textFieldEmail.text
        let phoneText = addContactScreen.textFieldPhone.text

        if name == "" || email == "" || phoneText == "" {
            //alert..
        } else {
            if let phone = Int(phoneText!) {
                let contact = Contact(name: name!, email: email!, phone: phone)

                saveContactToFireStore(contact: contact)
            }
        }

    }

    //MARK: logic to add a contact to Firestore...
    func saveContactToFireStore(contact: Contact) {
        if let userEmail = currentUser!.email {
            let collectionContacts =
                database
                .collection("users")
                .document(userEmail)
                .collection("contacts")
            showActivityIndicator()
            do {
                try collectionContacts.addDocument(
                    from: contact,
                    completion: { (error) in
                        if error == nil {
                            self.hideActivityIndicator()
                            self.navigationController?.popViewController(
                                animated: true)
                        }
                    })
            } catch {
                print("Error adding document!")
            }
        }
    }

}


extension AddContactViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
