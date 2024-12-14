//
//  AccountDetailsViewController.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import UIKit

class AccountDetailsViewController: UIViewController {

    let detailsScreen = AccountDetailsView()
    var details: AccountDetails?
    var delegate: NotesViewController?

    override func loadView() {
        view = detailsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let details = self.details {
            detailsScreen.name.text = details.name
            detailsScreen.email.text = details.email
        }
    }
}
