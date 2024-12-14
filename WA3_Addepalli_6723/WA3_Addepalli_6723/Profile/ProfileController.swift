//
//  ProfileController.swift
//  WA3_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 9/27/24.
//

import UIKit

class ProfileController: UIViewController {
    
    let profile = ProfileView()
    var dataReceived: ViewController.UserProfile = ViewController.UserProfile()
    
    override func loadView() {
        view = profile
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        profile.name.text = "Name: \(dataReceived.name!)"
        profile.email.text = "Email: \(dataReceived.email!)"
        profile.phone.text = "Phone: \(dataReceived.phoneNumber!) (\(dataReceived.phoneType!))"
        profile.address.text = "Address: \(dataReceived.address!)"
        profile.citystate.text = "City, State: \(dataReceived.citystate!)"
        profile.zipcode.text = "Zip Code: \(dataReceived.zipcode!)"
        profile.phoneImage.image = UIImage(named: dataReceived.phoneType!.lowercased())
        // Do any additional setup after loading the view.
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
