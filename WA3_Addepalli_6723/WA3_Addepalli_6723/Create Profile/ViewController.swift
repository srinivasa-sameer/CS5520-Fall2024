//
//  ViewController.swift
//  WA3_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 9/27/24.
//

import UIKit

class ViewController: UIViewController {
    
    let createProfile = CreateProfileView()
    
    let phoneTypes: [String] = ["Cell", "Home", "Work"]
    
    var selectedPhoneType = "Cell"
    
    public struct UserProfile {
        var name: String?
        var email: String?
        var phoneType: String?
        var phoneNumber: String?
        var address: String?
        var citystate: String?
        var zipcode: String?
        
        init(name: String? = nil,
             email: String? = nil,
             phoneType: String? = nil,
             phoneNumber: String? = nil,
             address: String? = nil,
             citystate: String? = nil,
             zipcode: String? = nil) {
            self.name = name
            self.email = email
            self.phoneType = phoneType
            self.phoneNumber = phoneNumber
            self.address = address
            self.citystate = citystate
            self.zipcode = zipcode
        }
    }
    
    override func loadView() {
        view = createProfile
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createProfile.typePicker.delegate = self
        createProfile.typePicker.dataSource = self
        createProfile.showProfileButton.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert!", message: "\(message)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func isEmailValid(email: String) -> Bool{
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }
    
    func isZipCodeValid(zipCode: String) -> Bool{
        let regex = "^[0-9]{5}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        let fiveDigits = predicate.evaluate(with: zipCode)
        
        if fiveDigits {
            if let zipInt = Int(zipCode), (zipInt >= 1 && zipInt <= 99950){
                return true
            }
        }
        return false
    }
    
    func isCityStateValid(citystate: String) -> Bool{
        let components = citystate.split(separator: ",")
        return components.count == 2 && !components[0].isEmpty && !components[1].isEmpty
    }
    
    @objc func onButtonClick() {
        if let name = createProfile.name.text, name.isEmpty {
            showAlert(message: "Name cannot be empty")
            return
        }
        
        // Email Validation
        if let email = createProfile.email.text, email.isEmpty {
            showAlert(message: "Email cannot be empty")
            return
        }else if let email = createProfile.email.text, !isEmailValid(email: email) {
            showAlert(message: "Please enter a valid email address!")
        }
        
        if let phone = createProfile.phone.text, phone.isEmpty {
            showAlert(message: "Phone number cannot be empty")
            return
        }
        
        if let address = createProfile.address.text, address.isEmpty {
            showAlert(message: "Address cannot be empty")
            return
        }
        
        if let citystate = createProfile.citystate.text, citystate.isEmpty {
            showAlert(message: "City/State cannot be empty")
            return
        }else if let citystate = createProfile.citystate.text, !isCityStateValid(citystate: citystate) {
            showAlert(message: "Please enter a valid City, State")
            return
        }
        
        if let zipcode = createProfile.zipcode.text, zipcode.isEmpty {
            showAlert(message: "Zipcode cannot be empty")
            return
        } else if let zipcode = createProfile.zipcode.text, !isZipCodeValid(zipCode: zipcode) {
            showAlert(message: "Invalid Zipcode")
            return
        }
        
        let userProfile = UserProfile(name: createProfile.name.text!,
                                  email: createProfile.email.text!,
                                  phoneType: selectedPhoneType,
                                  phoneNumber: createProfile.phone.text!,
                                  address: createProfile.address.text!,
                                  citystate: createProfile.citystate.text!,
                                  zipcode: createProfile.zipcode.text!)
        
        let profileController = ProfileController()
        profileController.dataReceived = userProfile
        
        
        navigationController?.pushViewController(profileController, animated: true)
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedPhoneType = phoneTypes[row]
        return phoneTypes[row]
    }
}
