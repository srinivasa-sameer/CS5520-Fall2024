//
//  ChatViewController.swift
//  WA8_27
//
//  Created by Vidhi Thacker on 11/14/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
    var otherUserId: String!
    var chatScreenView: ChatScreenView!
    var messages: [Message] = []
    
    private let db = Firestore.firestore()

    override func loadView() {
        chatScreenView = ChatScreenView()
        view = chatScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        setupViewDelegates()
        setupGestureRecognizers()
        
        loadChatMessages()
    }
    
    private func setupNavigation() {
        title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupViewDelegates() {
        chatScreenView.tableViewMessages.dataSource = self
        chatScreenView.tableViewMessages.delegate = self
        chatScreenView.messageTextField.delegate = self
        chatScreenView.tableViewMessages.register(ChatMessageCell.self, forCellReuseIdentifier: "MessageCell")
        chatScreenView.tableViewMessages.separatorStyle = .none
        chatScreenView.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }

    private func setupGestureRecognizers() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }

    @objc private func sendButtonTapped() {
        guard let messageText = chatScreenView.messageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !messageText.isEmpty else { return }

        sendChatMessage(messageText)
        chatScreenView.messageTextField.text = ""
    }

    private func sendChatMessage(_ messageText: String) {
        guard let currentUserId = Auth.auth().currentUser?.uid,
              let currentUserName = Auth.auth().currentUser?.displayName else { return }
        
        let chatDocumentName = generateChatDocumentName(currentUserId: currentUserId, otherUserId: otherUserId)
        let messageData: [String: Any] = [
            "text": messageText,
            "senderName": currentUserName,
            "senderID": currentUserId,
            "timestamp": FieldValue.serverTimestamp()
        ]

        db.collection("chats").document(chatDocumentName).collection("messages").addDocument(data: messageData) { error in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }

    private func loadChatMessages() {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        let chatDocumentName = generateChatDocumentName(currentUserId: currentUserId, otherUserId: otherUserId)

        db.collection("chats").document(chatDocumentName).collection("messages")
            .order(by: "timestamp")
            .addSnapshotListener { [weak self] querySnapshot, error in
                guard let self = self else { return }
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching messages: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                self.messages = documents.compactMap { document in
                    let data = document.data()
                    guard let text = data["text"] as? String,
                          let senderID = data["senderID"] as? String,
                          let senderName = data["senderName"] as? String,
                          let timestamp = data["timestamp"] as? Timestamp else { return nil }
                    return Message(text: text, senderID: senderID, senderName: senderName, timestamp: timestamp.dateValue())
                }
                self.chatScreenView.tableViewMessages.reloadData()
                self.scrollToLastMessage()
            }
    }

    private func scrollToLastMessage() {
        guard !messages.isEmpty else { return }
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        chatScreenView.tableViewMessages.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

    private func generateChatDocumentName(currentUserId: String, otherUserId: String) -> String {
        [currentUserId, otherUserId].sorted().joined(separator: "+")
    }

    @objc private func hideKeyboardOnTap() {
        view.endEditing(true)
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! ChatMessageCell
        let message = messages[indexPath.row]
        let isCurrentUser = message.senderID == Auth.auth().currentUser?.uid
        cell.configure(withMessage: message, isCurrentUser: isCurrentUser)
        return cell
    }
}

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        sendButtonTapped()
        return true
    }
}
