//
//  ViewController.swift
//  WA8_27
//
//  Created by Vidhi Thacker on 11/14/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    let mainScreen = MainScreenView()
    var chatsList = [Chat]()
    let childProgressView = ProgressSpinnerViewController()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    
    override func loadView() {
        view = mainScreen
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
              if user == nil{
                  self.currentUser = nil
                  self.mainScreen.labelText.text = "Please sign in to access chats."
                  self.chatsList.removeAll()
                  self.mainScreen.tableViewChats.reloadData()
                  self.setupRightBarButton(isLoggedin: false)
              } else {
                  self.fetchUsers()
                  self.currentUser = user
                  self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")! Click on a user to start chatting."
                  self.setupRightBarButton(isLoggedin: true)
              }
          }
      }
    
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         Auth.auth().removeStateDidChangeListener(handleAuth!)
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Chats"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        mainScreen.tableViewChats.delegate = self
        mainScreen.tableViewChats.dataSource = self
        
        mainScreen.tableViewChats.separatorStyle = .none
    }
    
    func fetchUsers() {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users").whereField("uid", isNotEqualTo: currentUserId).getDocuments { (snapshot, error) in
            if let error = error {
                // Handle the error
                print("Error getting documents: \(error)")
            } else {
                var fetchedChats = [Chat]()
                for document in snapshot!.documents {
                    let data = document.data()
                    let uid = data["uid"] as? String ?? ""
                    let name = data["name"] as? String ?? "No Name"
                    print(name)
                    
                    // Exclude the current user
                    if uid != currentUserId {
                        let chat = Chat(name: name, userId: uid) 
                        fetchedChats.append(chat)
                    }
                }
                self.chatsList = fetchedChats
                DispatchQueue.main.async {
                    self.mainScreen.tableViewChats.reloadData()
                }
            }
        }
    }
}
