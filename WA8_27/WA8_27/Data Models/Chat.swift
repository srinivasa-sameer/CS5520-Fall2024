//
//  Chat.swift
//  WA8_27
//
//  Created by Vidhi Thacker on 11/14/24.
//

import Foundation

struct Chat: Codable {
    var name: String
    var userId: String
    
    init(name: String, userId: String) {
        self.name = name
        self.userId = userId
    }
}
