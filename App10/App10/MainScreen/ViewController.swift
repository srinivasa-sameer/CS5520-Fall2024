//
//  ViewController.swift
//  App10
//
//  Created by Srinivasa Sameer Addepalli on 10/22/24.
//

import Alamofire
import UIKit

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
    var viewContact: Contact!
    var contactNames = [String]()
    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contacts"

        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.separatorStyle = .none

        mainScreen.buttonAdd.addTarget(
            self, action: #selector(onButtonAddTapped), for: .touchUpInside)
        notificationCenter.addObserver(
            self,
            selector: #selector(deleteContactNotification(notification:)),
            name: .delete,
            object: nil)
        notificationCenter.addObserver(
            self,
            selector: #selector(editContactNotification(notification:)),
            name: .edit,
            object: nil)

        getAllContacts()
    }

    @objc func editContactNotification(notification: Notification) {
        let object = notification.object as? EditNotification
        if let object = object {
            let oldName = object.oldName
            addAndDeleteContact(contact: object.contact, oldName: oldName)
        }
    }

    @objc func deleteContactNotification(notification: Notification) {
        self.deleteContact(name: notification.object as! String)
    }

    @objc func onButtonAddTapped() {
        if let name = mainScreen.textFieldAddName.text, name.isEmpty {
            showAlert(text: "Name field cannot be empty")
            return
        }

        if let email = mainScreen.textFieldAddEmail.text, email.isEmpty {
            showAlert(text: "Email field cannot be empty")
            return
        } else if let email = mainScreen.textFieldAddEmail.text,
            !isEmailValid(email)
        {
            showAlert(text: "Please enter a valid email address")
            return
        }

        if let phone = mainScreen.textFieldAddPhone.text, phone.isEmpty {
            showAlert(text: "Phone field cannot be empty")
            return
        } else if let phone = mainScreen.textFieldAddPhone.text,
            !isPhoneValid(phone)
        {
            showAlert(text: "Please enter a valid phone number")
            return
        }

        let contact = Contact(
            name: mainScreen.textFieldAddName.text!,
            email: mainScreen.textFieldAddEmail.text!,
            phone: Int(mainScreen.textFieldAddPhone.text!)!)
        addANewContact(contact: contact)
    }

    func clearAddViewTextFields() {
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }

    func addANewContact(contact: Contact) {
        if let url = URL(string: APIConfigs.baseURL + "add") {

            AF.request(
                url, method: .post,
                parameters: [
                    "name": contact.name,
                    "email": contact.email,
                    "phone": contact.phone,
                ]
            )
            .responseString(completionHandler: { response in
                let status = response.response?.statusCode

                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            self.getAllContacts()
                            self.clearAddViewTextFields()
                            break

                        case 400...499:
                            print(data)
                            break

                        default:
                            print(data)
                            break

                        }
                    }
                    break

                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }

    func deleteContact(name: String) {
        if let url = URL(string: APIConfigs.baseURL + "delete") {
            AF.request(
                url, method: .get,
                parameters: ["name": name],
                encoding: URLEncoding.queryString
            )
            .responseString(completionHandler: { response in

                let status = response.response?.statusCode

                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            print(data)
                            self.getAllContacts()
                            break

                        case 400...499:
                            print(data)
                            break

                        default:
                            print(data)
                            break
                        }
                    }
                    break

                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }

    func addAndDeleteContact(contact: Contact, oldName: String) {
        if let url = URL(string: APIConfigs.baseURL + "delete") {
            AF.request(
                url, method: .get, parameters: ["name": oldName]
            ).responseString(completionHandler: { response in
                let status = response.response?.statusCode

                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            print(data)
                            self.addANewContact(contact: contact)
                            break

                        case 400...499:
                            print(data)
                            break

                        default:
                            print(data)
                            break
                        }
                    }

                    break

                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }

    func getAllContacts() {
        if let url = URL(string: APIConfigs.baseURL + "getall") {
            AF.request(url, method: .get).responseString(completionHandler: {
                response in

                let status = response.response?.statusCode

                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            let names = data.components(separatedBy: "\n")
                            self.contactNames = names
                            self.contactNames.removeLast()
                            self.mainScreen.tableViewContacts.reloadData()
                            print(self.contactNames)
                            break

                        case 400...499:
                            print(data)
                            break

                        default:
                            print(data)
                            break

                        }
                    }
                    break

                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }

    func getContactDetails(name: String) {
        if let url = URL(string: APIConfigs.baseURL + "details") {
            AF.request(
                url, method: .get,
                parameters: ["name": name]
            )
            .responseString(completionHandler: { response in

                let status = response.response?.statusCode

                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            let parts = data.components(separatedBy: ",")
                            let name = parts[0].trimmingCharacters(
                                in: .whitespacesAndNewlines)
                            let email = parts[1].trimmingCharacters(
                                in: .whitespacesAndNewlines)
                            let phone = Int(
                                parts[2].trimmingCharacters(
                                    in: .whitespacesAndNewlines))!
                            let contact = Contact(
                                name: name, email: email, phone: phone)
                            let contactDetailsViewController =
                                ContactDetailsViewController()
                            contactDetailsViewController.contact = contact
                            self.navigationController?.pushViewController(
                                contactDetailsViewController, animated: true)
                            break

                        case 400...499:
                            print(data)
                            break

                        default:
                            print(data)
                            break
                        }
                    }
                    break

                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }

    func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isPhoneValid(_ phone: String) -> Bool {
        let phoneRegex = #"^\d{10}$"#
        guard let regex = try? NSRegularExpression(pattern: phoneRegex) else {
            return false
        }
        let range = NSRange(location: 0, length: phone.utf16.count)
        return regex.firstMatch(in: phone, options: [], range: range) != nil
    }

    func showAlert(text: String) {
        let alert = UIAlertController(
            title: "Alert!",
            message: "\(text)",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))

        self.present(alert, animated: true)
    }

    //    func showDetailsInAlert(data: String) {
    //        let parts = data.components(separatedBy: ",")
    //        print(parts)
    //
    //        //MARK: trim the whitespaces from the strings, and show alert...
    //        let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
    //        let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
    //        if let phone = Int(
    //            parts[2].trimmingCharacters(in: .whitespacesAndNewlines))
    //        {
    //            //MARK: show alert...
    //            let message = """
    //                name: \(name)
    //                email: \(email)
    //                phone: \(phone)
    //                """
    //            let alert = UIAlertController(
    //                title: "Selected Contact", message: message,
    //                preferredStyle: .alert)
    //            alert.addAction(UIAlertAction(title: "OK", style: .default))
    //            self.present(alert, animated: true)
    //        }
    //
    //    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return contactNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "names", for: indexPath)
            as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        return cell
    }

    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        getContactDetails(name: self.contactNames[indexPath.row])
        mainScreen.tableViewContacts.deselectRow(at: indexPath, animated: true)
    }
}
