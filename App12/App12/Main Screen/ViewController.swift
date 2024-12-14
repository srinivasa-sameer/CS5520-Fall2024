//
//  ViewController.swift
//  App12
//
//  Created by Srinivasa Sameer Addepalli on 11/14/24.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit

class ViewController: UIViewController {

    let mainScreen = MainScreenView()

    let childProgressView = ProgressSpinnerViewController()

    var contactsList = [Contact]()

    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?

    let database = Firestore.firestore()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                //MARK: not signed in...
                self.currentUser = nil
                self.mainScreen.labelText.text =
                    "Please sign in to see the contacts!"
                self.mainScreen.floatingButtonAddContact.isEnabled = false
                self.mainScreen.floatingButtonAddContact.isHidden = true

                //MARK: Reset tableView...
                self.contactsList.removeAll()
                self.mainScreen.tableViewContacts.reloadData()
                self.setupRightBarButton(isLoggedin: false)

            } else {
                //MARK: the user is signed in...
                self.currentUser = user
                self.mainScreen.labelText.text =
                    "Welcome \(user?.displayName ?? "Anonymous")!"
                self.mainScreen.floatingButtonAddContact.isEnabled = true
                self.mainScreen.floatingButtonAddContact.isHidden = false
                self.setupRightBarButton(isLoggedin: true)

                //MARK: setting the profile photo...
                if let url = self.currentUser?.photoURL {
                    self.mainScreen.profilePic.loadRemoteImage(from: url)
                }

                //MARK: Observe Firestore database to display the contacts list...
                self.database.collection("users")
                    .document((self.currentUser?.email)!)
                    .collection("contacts")
                    .addSnapshotListener(
                        includeMetadataChanges: false,
                        listener: { querySnapshot, error in
                            if let documents = querySnapshot?.documents {
                                self.contactsList.removeAll()
                                for document in documents {
                                    do {
                                        let contact = try document.data(
                                            as: Contact.self)
                                        self.contactsList.append(contact)
                                    } catch {
                                        print(error)
                                    }
                                }
                                self.contactsList.sort(by: { $0.name < $1.name }
                                )
                                self.mainScreen.tableViewContacts.reloadData()
                            }
                        })
            }
        }
    }

    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "My Contacts"

        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.dataSource = self

        mainScreen.tableViewContacts.separatorStyle = .none

        navigationController?.navigationBar.prefersLargeTitles = true

        view.bringSubviewToFront(mainScreen.floatingButtonAddContact)

        mainScreen.floatingButtonAddContact.addTarget(
            self, action: #selector(addContactButtonTapped), for: .touchUpInside
        )
    }

    @objc func addContactButtonTapped() {
        let addContactController = AddContactViewController()
        addContactController.currentUser = self.currentUser
        navigationController?.pushViewController(
            addContactController, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }

}

extension ViewController: ProgressSpinnerDelegate {
    func showActivityIndicator() {
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }

    func hideActivityIndicator() {
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
