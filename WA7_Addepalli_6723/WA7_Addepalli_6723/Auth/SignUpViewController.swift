//
//  SignUpViewController.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import Alamofire
import UIKit

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()

    override func loadView() {
        view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        signUpView.signUpButton.addTarget(
            self, action: #selector(onSignUpButtonTapped), for: .touchUpInside)
    }

    @objc func onSignUpButtonTapped() {
        getAuthToken()
    }

    func getAuthToken() {
        struct AuthResponse: Decodable {
            let auth: Bool
            let token: String
        }

        struct LoginRequest: Encodable {
            let name: String
            let email: String
            let password: String
        }

        guard let name = signUpView.name.text, !name.isEmpty else {
            showErrorAlert(message: "Name must not be empty!")
            return
        }
        guard let email = signUpView.email.text, !email.isEmpty else {
            showErrorAlert(message: "Email must not be empty!")
            return
        }

        if !isValidEmail(email) {
            showErrorAlert(message: "Enter a Valid Email")
            return
        }

        guard let password = signUpView.password.text, !password.isEmpty else {
            showErrorAlert(message: "Password must not be empty!")
            return
        }

        let request = LoginRequest(name: name, email: email, password: password)
        if let url = URL(string: APIConfigs.baseURL + "auth/register") {

            AF.request(
                url, method: .post, parameters: request,
                encoder: JSONParameterEncoder.default
            )
            .responseDecodable(of: AuthResponse.self) { response in
                switch response.result {
                case .success(let authResponse):
                    if authResponse.auth {
                        UserDefaults.standard.set(
                            authResponse.token, forKey: "AuthToken")
                        print(
                            "Token stored in UserDefaults: \(authResponse.token)"
                        )
                        let allNotes = NotesViewController()
                        allNotes.navigationItem.hidesBackButton = true
                        self.navigationController?.pushViewController(
                            allNotes, animated: true)

                    } else {
                        self.showErrorAlert(message: "User Already Exists")
                        print("Authentication failed")
                    }
                case .failure(_):
                    self.showErrorAlert(message: "Authentication failed")
                }
            }
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func showErrorAlert(message: String?) {
        let alert = UIAlertController(
            title: "Error!", message: message,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))

        self.present(alert, animated: true)
    }
}
