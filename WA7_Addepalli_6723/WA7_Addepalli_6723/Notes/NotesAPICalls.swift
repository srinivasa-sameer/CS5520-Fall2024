//
//  NotesAPICalls.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import Alamofire
import Foundation
import UIKit

extension NotesViewController: NotesProtocol {
    func getNotes() {
        if let url = URL(string: APIConfigs.baseURL + "note/getall") {
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
                                    self.notes.removeAll()
                                    let receivedData =
                                        try decoder
                                        .decode(Notes.self, from: data)
                                    for item in receivedData.notes {
                                        self.notes.append(item)
                                    }
                                    self.mainScreen.notesTableView.reloadData()
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

    func addANewNote(note: Note) {
        if let url = URL(string: APIConfigs.baseURL + "note/post") {
            let apiKeySaved =
                UserDefaults.standard.object(forKey: "AuthToken") as! String?
            var headers: HTTPHeaders? = nil
            if let apiKey = apiKeySaved {
                headers = ["x-access-token": apiKey]
            }

            AF.request(
                url, method: .post,
                parameters: [
                    "text": note.text
                ], headers: headers
            )
            .responseString(completionHandler: { response in
                let status = response.response?.statusCode

                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            self.getNotes()
                            self.clearAddViewFields()
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
}
