//
//  Contact.swift
//  WA4_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 10/6/24.
//

import Foundation
import UIKit

struct Contact {
    var name: String?
    var email: String?
    var phoneType: String?
    var phoneNumber: String?
    var address: String?
    var citystate: String?
    var zipcode: String?
    var image: UIImage?
    init(
        name: String? = nil, email: String? = nil, phoneType: String? = nil,
        phoneNumber: String? = nil, address: String? = nil, citystate: String? = nil,
        zipcode: String? = nil, image: UIImage? = nil
    ) {
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.citystate = citystate
        self.zipcode = zipcode
        self.image = image
    }
}
