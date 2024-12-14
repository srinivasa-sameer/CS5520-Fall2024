//
//  Expense.swift
//  App5
//
//  Created by Srinivasa Sameer Addepalli on 10/11/24.
//

import Foundation

struct Expense {
    var title: String?
    var amount: Double?
    var type: String?

    init(title: String? = nil, amount: Double? = nil, type: String? = nil) {
        self.title = title
        self.amount = amount
        self.type = type
    }

}
