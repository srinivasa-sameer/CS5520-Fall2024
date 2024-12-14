//
//  EditNotification.swift
//  App10
//
//  Created by Srinivasa Sameer Addepalli on 10/23/24.
//

import Foundation

struct EditNotification {
    var contact: Contact
    var oldName: String
    init(contact: Contact, oldName: String) {
        self.contact = contact
        self.oldName = oldName
    }
}
