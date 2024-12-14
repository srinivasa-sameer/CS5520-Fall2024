//
//  ViewController.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import Alamofire
import UIKit

class ViewController: UIViewController {

    let mainScreen = LoginView()
    let signUpViewController = SignUpViewController()

    override func loadView() {
        setupNavigationBar()
        if isAuthenticated() {
            navigateToNotesScreen()
        } else {
            setupMainScreen()
        }
    }

    func isAuthenticated() -> Bool {
        return UserDefaults.standard.string(forKey: "AuthToken") != nil
    }

    func navigateToNotesScreen() {
        let notesScreen = NotesViewController()
        navigationController?.pushViewController(notesScreen, animated: true)
    }

    func setupMainScreen() {
        view = mainScreen
        mainScreen.signUpButton.addTarget(
            self,
            action: #selector(onSignUpButtonTapped),
            for: .touchUpInside
        )

        mainScreen.loginButton.addTarget(
            self,
            action: #selector(onLoginButtonTapped),
            for: .touchUpInside
        )
    }

    func setupNavigationBar() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        title = "Notes App"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func onSignUpButtonTapped() {
        navigationController?.pushViewController(
            signUpViewController, animated: true)
    }

    @objc func onLoginButtonTapped() {

        guard let email = mainScreen.email.text, !email.isEmpty else {
            showErrorAlert(message: "Email must not be empty!")
            return
        }

        guard isValidEmail(email) else {
            showErrorAlert(message: "Enter a Valid Email")
            return
        }

        guard let password = mainScreen.password.text, !password.isEmpty else {
            showErrorAlert(message: "Password must not be empty!")
            return
        }

        authenticateUser(email: email, password: password)

    }

    func authenticateUser(email: String, password: String) {
        struct AuthResponse: Decodable {
            let auth: Bool
            let token: String
        }

        guard let email = mainScreen.email.text, !email.isEmpty else {
            showErrorAlert(message: "Email must not be empty!")
            return
        }

        if !isValidEmail(email) {
            showErrorAlert(message: "Enter a Valid Email")
            return
        }

        guard let password = mainScreen.password.text, !password.isEmpty else {
            showErrorAlert(message: "Password must not be empty!")
            return
        }

        if let url = URL(string: APIConfigs.baseURL + "auth/login") {
            let encodedEmail =
                email.addingPercentEncoding(
                    withAllowedCharacters: .urlQueryAllowed) ?? email
            let encodedPassword =
                password.addingPercentEncoding(
                    withAllowedCharacters: .urlQueryAllowed) ?? password

            let bodyString = "email=\(encodedEmail)&password=\(encodedPassword)"
            let bodyData = bodyString.data(using: .utf8) ?? Data()

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue(
                "application/x-www-form-urlencoded",
                forHTTPHeaderField: "Content-Type")
            request.httpBody = bodyData

            AF.request(request)
                .responseDecodable(of: AuthResponse.self) { response in
                    switch response.result {
                    case .success(let authResponse):
                        if authResponse.auth {
                            UserDefaults.standard.set(
                                authResponse.token, forKey: "AuthToken")
                            print(
                                "Token is stored in UserDefaults: \(authResponse.token)"
                            )
                            let notesScreen = NotesViewController()
                            notesScreen.navigationItem.hidesBackButton = true
                            self.navigationController?.pushViewController(
                                notesScreen, animated: true)

                        } else {
                            self.showErrorAlert(message: "User Already Exists")
                        }
                    case .failure(_):
                        self.showErrorAlert(
                            message: "Issue with Authentication")
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
