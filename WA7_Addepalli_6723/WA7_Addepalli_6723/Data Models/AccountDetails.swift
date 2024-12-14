//
//  AccountDetails.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import Foundation

struct AccountDetails: Codable {
    var _id: String
    var name: String
    var email: String

    init(_id: String, name: String, email: String) {
        self._id = _id
        self.name = name
        self.email = email
    }
}
