//
//  RegisterFirebaseManager.swift
//  App12
//
//  Created by Srinivasa Sameer Addepalli on 11/14/24.
//

import FirebaseAuth
import Foundation

extension RegisterViewController {
    func uploadProfilePhotoToStorage() {
        var profilePhotoURL: URL?

        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage {
            if let jpegData = image.jpegData(compressionQuality: 80) {
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")

                let uploadTask = imageRef.putData(
                    jpegData,
                    completion: { (metadata, error) in
                        if error == nil {
                            imageRef.downloadURL(completion: { (url, error) in
                                if error == nil {
                                    profilePhotoURL = url
                                    self.registerUser(photoURL: profilePhotoURL)
                                }
                            })
                        }
                    })
            }
        } else {
            registerUser(photoURL: profilePhotoURL)
        }
    }

    func registerUser(photoURL: URL?) {
        if let name = registerView.textFieldName.text,
            let email = registerView.textFieldEmail.text,
            let password = registerView.textFieldPassword.text
        {
            Auth.auth().createUser(
                withEmail: email, password: password,
                completion: { result, error in
                    if error == nil {
                        self.setNameAndPhotoOfTheUserInFirebaseAuth(
                            name: name, email: email, photoURL: photoURL)
                    }
                })
        }
    }

    func setNameAndPhotoOfTheUserInFirebaseAuth(
        name: String, email: String, photoURL: URL?
    ) {
        let changeRequest = Auth.auth().currentUser?
            .createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL

        print("\(photoURL)")
        changeRequest?.commitChanges(completion: { (error) in
            if error != nil {
                print("Error occured: \(String(describing: error))")
            } else {
                self.hideActivityIndicator()
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
}
