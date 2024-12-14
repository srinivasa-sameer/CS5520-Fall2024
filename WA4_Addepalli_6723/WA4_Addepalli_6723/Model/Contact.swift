//
//  Contact.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import Foundation

struct Contact {
    var name: String?
    var email: String?
    var phoneType: String?
    var phoneNumber: String?
    var address: String?
    var citystate: String?
    var zipcode: String?
    init(
        name: String? = nil, email: String? = nil, phoneType: String? = nil,
        phoneNumber: String? = nil, address: String? = nil, citystate: String? = nil,
        zipcode: String? = nil
    ) {
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.citystate = citystate
        self.zipcode = zipcode
    }
}
