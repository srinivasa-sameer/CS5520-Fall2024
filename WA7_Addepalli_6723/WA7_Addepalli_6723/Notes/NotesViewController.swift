//
//  NotesViewController.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import Alamofire
import UIKit

class NotesViewController: UIViewController {
    let mainScreen = NotesView()

    var details: AccountDetails!

    var notes = [NotesObj]()

    override func loadView() {
        view = mainScreen
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Notes"
        mainScreen.notesTableView.dataSource = self
        mainScreen.notesTableView.delegate = self
        mainScreen.notesTableView.separatorStyle = .none

        getNotes()

        mainScreen.addButton.addTarget(
            self, action: #selector(onButtonAddTapped), for: .touchUpInside)

        let accountButton = UIButton(type: .system)
        accountButton.setTitle("Account", for: .normal)
        accountButton.titleLabel?.font = .boldSystemFont(ofSize: 14)

        accountButton.addTarget(
            self, action: #selector(onButtonAccountTapped), for: .touchUpInside)
        let accountBarButtonItem = UIBarButtonItem(customView: accountButton)

        navigationItem.leftBarButtonItem = accountBarButtonItem

        let logoutButton = UIButton(type: .system)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font = .boldSystemFont(ofSize: 14)

        logoutButton.addTarget(
            self, action: #selector(onButtonLogoutTapped), for: .touchUpInside)
        let logoutBarButtonItem = UIBarButtonItem(customView: logoutButton)

        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }

    @objc func onButtonAddTapped() {
        if let name = mainScreen.notesInput.text {
            let note = Note(text: name)
            addANewNote(note: note)
        } else {
            //alert....
        }
    }

    @objc func onButtonAccountTapped() {
        getAccountDetails()

    }

    @objc func onButtonLogoutTapped() {
        UserDefaults.standard.removeObject(forKey: "AuthToken")
        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func clearAddViewFields() {
        mainScreen.notesInput.text = ""
    }

    @objc func deleteSelectedFor(note: Int) {
        deleteNote(id: notes[note]._id ?? "", note: note)
    }

    func deleteNote(id: String, note: Int) {
        if let url = URL(string: APIConfigs.baseURL + "note/delete") {
            let apiKeySaved =
                UserDefaults.standard.object(forKey: "AuthToken") as! String?
            var headers: HTTPHeaders? = nil
            if let apiKey = apiKeySaved {
                headers = ["x-access-token": apiKey]
            }

            AF.request(
                url, method: .post,
                parameters: [
                    "id": id
                ], headers: headers
            )
            .responseString(completionHandler: { response in
                let status = response.response?.statusCode

                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            print("success")
                            self.notes.remove(at: note)
                            self.getNotes()
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
        } else {
        }
    }

    func getAccountDetails() {
        if let url = URL(string: APIConfigs.baseURL + "auth/me") {
            let apiKeySaved =
                UserDefaults.standard.object(forKey: "AuthToken") as! String?
            var headers: HTTPHeaders? = nil
            if let apiKey = apiKeySaved {
                headers = ["x-access-token": apiKey]
            }
            AF.request(url, method: .get, headers: headers).responseData(
                completionHandler: { response in
                    let status = response.response?.statusCode

                    switch response.result {
                    case .success(let data):
                        if let uwStatusCode = status {
                            switch uwStatusCode {
                            case 200...299:
                                let decoder = JSONDecoder()
                                do {
                                    let receivedData = try decoder.decode(
                                        AccountDetails.self, from: data)
                                    let accountDetailsController =
                                        AccountDetailsViewController()
                                    accountDetailsController.details =
                                        receivedData
                                    accountDetailsController.delegate = self
                                    self.navigationController?
                                        .pushViewController(
                                            accountDetailsController,
                                            animated: true)
                                    print(receivedData)

                                } catch {
                                    print("JSON couldn't be decoded.")
                                }
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
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "notes", for: indexPath) as! NotesTableViewCell
        cell.noteContent.text = notes[indexPath.row].text

        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        buttonOptions.setImage(
            UIImage(systemName: "ellipsis"), for: .normal)

        buttonOptions.menu = UIMenu(
            title: "Options",
            children: [
                UIAction(
                    title: "Delete",
                    handler: { (_) in
                        self.deleteSelectedFor(note: indexPath.row)
                    })
            ])
        cell.accessoryView = buttonOptions
        
        return cell
    }

    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
    }
}
