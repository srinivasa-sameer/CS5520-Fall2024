//
//  ChatScreenView.swift
//  WA8_27
//
//  Created by Vidhi Thacker on 11/14/24.
//

import UIKit

class ChatScreenView: UIView {
    let tableViewMessages: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let messageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type your message..."
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var messageTextFieldBottomConstraint: NSLayoutConstraint!
    private var sendButtonBottomConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupViews()
        setupConstraints()
        setupKeyboardHandling()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(tableViewMessages)
        addSubview(messageTextField)
        addSubview(sendButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // TableView constraints
            tableViewMessages.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            tableViewMessages.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewMessages.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewMessages.bottomAnchor.constraint(equalTo: messageTextField.topAnchor, constant: -16),
            
            // MessageTextField constraints
            messageTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -16),
            messageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // SendButton constraints
            sendButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            sendButton.widthAnchor.constraint(equalToConstant: 80),
            sendButton.heightAnchor.constraint(equalTo: messageTextField.heightAnchor)
        ])
        
        // Dynamic bottom constraints for keyboard handling
        messageTextFieldBottomConstraint = messageTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        sendButtonBottomConstraint = sendButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        
        messageTextFieldBottomConstraint.isActive = true
        sendButtonBottomConstraint.isActive = true
    }

    private func setupKeyboardHandling() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        adjustForKeyboard(notification: notification, isShowing: true)
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        adjustForKeyboard(notification: notification, isShowing: false)
    }

    private func adjustForKeyboard(notification: Notification, isShowing: Bool) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let adjustmentHeight = isShowing ? -keyboardFrame.height - 16 : -16
        messageTextFieldBottomConstraint.constant = adjustmentHeight
        sendButtonBottomConstraint.constant = adjustmentHeight
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}
