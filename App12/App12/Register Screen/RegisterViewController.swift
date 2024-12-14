//
//  RegisterViewController.swift
//  App12
//
//  Created by Srinivasa Sameer Addepalli on 11/14/24.
//

import FirebaseAuth
import FirebaseFirestore
import UIKit
import PhotosUI
import FirebaseStorage

class RegisterViewController: UIViewController {
    
    let storage = Storage.storage()
    let registerView = RegisterView()
    let childProgressView = ProgressSpinnerViewController()
    var pickedImage: UIImage?

    override func loadView() {
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        registerView.buttonRegister.addTarget(
            self, action: #selector(onRegisterTapped), for: .touchUpInside)
        title = "Register"
        registerView.buttonTakePhoto.menu = getMenuImagePicker()
    }

    func getMenuImagePicker() -> UIMenu {
        let menuItems = [
            UIAction(
                title: "Camera",
                handler: { (_) in
                    self.pickUsingCamera()
                }),
            UIAction(
                title: "Gallery",
                handler: { (_) in
                    self.pickPhotoFromGallery()
                }),
        ]

        return UIMenu(title: "Select source", children: menuItems)
    }

    //MARK: take Photo using Camera...
    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }

    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery() {
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1

        let photoPicker = PHPickerViewController(configuration: configuration)

        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }

    @objc func onRegisterTapped() {
        //MARK: creating a new user on Firebase...
        showActivityIndicator()
        uploadProfilePhotoToStorage()
    }

}
