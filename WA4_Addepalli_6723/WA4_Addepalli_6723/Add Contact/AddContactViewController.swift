//
//  AddContactViewController.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import UIKit

class AddContactViewController: UIViewController {
    let addContactScreenView = AddContactView()
    var selectedType = "Cell"
    var delegate:ViewController!
    
    override func loadView() {
        view = addContactScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addContactScreenView.cellTypePicker.delegate = self
        addContactScreenView.cellTypePicker.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onButtonSave)
        )
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func isValidZIPCode(_ zipCode: String) -> Bool {
        let zipCodeRegex = "^[0-9]{5}$"
        let zipCodePredicate = NSPredicate(format: "SELF MATCHES %@", zipCodeRegex)
        let isFiveDigits = zipCodePredicate.evaluate(with: zipCode)

        if isFiveDigits {
            if let zipInt = Int(zipCode), (zipInt >= 1 && zipInt <= 99950) {
                return true
            }
        }

        return false
    }

    func showAlertText(text:String){
        let alert = UIAlertController(
            title: "Alert!!!",
            message: "\(text)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegex = #"^\d{10}$"#
        guard let regex = try? NSRegularExpression(pattern: phoneRegex) else {
            return false
        }
        let range = NSRange(location: 0, length: phoneNumber.utf16.count)
        return regex.firstMatch(in: phoneNumber, options: [], range: range) != nil
    }
    
    @objc func onButtonSave(){
        if let name = addContactScreenView.name.text, name.isEmpty {
            showAlertText(text: "Name field cannot be empty")
            return
        }

        if let email = addContactScreenView.email.text, email.isEmpty {
            showAlertText(text: "Email field cannot be empty")
            return
        }else if let email = addContactScreenView.email.text, !isValidEmail(email) {
            showAlertText(text: "Please enter a valid email address")
            return
        }

        if let phone = addContactScreenView.phone.text, phone.isEmpty {
            showAlertText(text: "Phone field cannot be empty")
            return
        }else if let phone = addContactScreenView.phone.text, !isValidPhoneNumber(phone) {
            showAlertText(text: "Please enter a valid phone number")
            return
        }

        if let address = addContactScreenView.address.text, address.isEmpty {
            showAlertText(text: "Address field cannot be empty")
            return
        }

        if let citystate = addContactScreenView.citystate.text, citystate.isEmpty {
            showAlertText(text: "City, State field cannot be empty")
            return
        }

        if let zipcode = addContactScreenView.zipcode.text, zipcode.isEmpty {
            showAlertText(text: "Zip code field cannot be empty")
            return
        } else if let zipcode = addContactScreenView.zipcode.text, !isValidZIPCode(zipcode) {
            showAlertText(text: "Invalid Zip code")
            return
        }
        
        let userContact = Contact(
            name: addContactScreenView.name.text!,
            email: addContactScreenView.email.text!,
            phoneType: selectedType,
            phoneNumber: addContactScreenView.phone.text!,
            address: addContactScreenView.address.text!,
            citystate: addContactScreenView.citystate.text!,
            zipcode: addContactScreenView.zipcode.text!
        )
        delegate.delegateOnAddContact(contact: userContact)
        navigationController?.popViewController(animated: true)

    }

}

extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK: we are using only one section...
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: we are displaying the options from Utilities.types...
        return Utilities.phoneTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //MARK: updating the selected type when the user picks this row...
        selectedType = Utilities.phoneTypes[row]
        return Utilities.phoneTypes[row]
    }
}
