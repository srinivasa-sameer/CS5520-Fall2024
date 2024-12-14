//
//  EditContactViewController.swift
//  App10
//
//  Created by Srinivasa Sameer Addepalli on 10/23/24.
//

import Alamofire
import UIKit

class EditContactViewController: UIViewController {

    let editContactView = EditContactView()
    var contact: Contact!
    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = editContactView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Contact"

        populateTextFields()

        editContactView.saveButton.addTarget(
            self, action: #selector(sendNotificationToMainScreen),
            for: .touchUpInside)
    }

    func populateTextFields() {
        editContactView.name.text = contact.name
        editContactView.phone.text = String(contact.phone)
        editContactView.email.text = contact.email
    }

    @objc func sendNotificationToMainScreen() {
        if let name = editContactView.name.text, name.isEmpty {
            showAlert(text: "Name cannot be empty!")
            return
        }

        if let email = editContactView.email.text, email.isEmpty {
            showAlert(text: "Email cannot be empty!")
            return
        } else if let email = editContactView.email.text, !isEmailValid(email) {
            showAlert(text: "Please enter a valid email id!")
            return
        }

        if let phone = editContactView.phone.text, phone.isEmpty {
            showAlert(text: "Phone Number cannot be empty!")
            return
        } else if let phone = editContactView.phone.text, !isPhoneValid(phone) {
            showAlert(text: "Please enter a valid phone number!")
            return
        }

        let editedContact = Contact(
            name: editContactView.name.text!,
            email: editContactView.email.text!,
            phone: Int(editContactView.phone.text!)!)

        let obj = EditNotification(
            contact: editedContact, oldName: contact.name)
        notificationCenter.post(name: .edit, object: obj)
        navigationController?.popViewController(animated: true)
    }

    func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isPhoneValid(_ phoneNumber: String) -> Bool {
        let phoneRegex = #"^\d{10}$"#
        guard let regex = try? NSRegularExpression(pattern: phoneRegex) else {
            return false
        }
        let range = NSRange(location: 0, length: phoneNumber.utf16.count)
        return regex.firstMatch(in: phoneNumber, options: [], range: range)
            != nil
    }

    func showAlert(text: String) {
        let alert = UIAlertController(
            title: "Alert!", message: "\(text)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

}
