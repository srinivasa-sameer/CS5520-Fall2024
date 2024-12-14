//
//  Notes.swift
//  WA7_Addepalli_6723
//
//  Created by Srinivasa Sameer Addepalli on 11/3/24.
//

import Foundation

struct Note: Codable {
    let text: String
}

struct Notes: Codable {
    let notes: [NotesObj]
}

struct NotesObj: Codable {
    var text: String
    var _id: String?

    init(text: String, _id: String?) {
        self.text = text
        self._id = _id
    }
}
