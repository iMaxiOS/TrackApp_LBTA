//
//  MockData.swift
//  Tracker_SwiftUI_LBTA
//
//  Created by Maxim Hranchenko on 19.10.2022.
//

import Foundation
import SwiftUI

var transactionMockData = Transaction(
    id: 0,
    date: "01/05/2021",
    institution: "Desjardins",
    account: "Visa Desjardins",
    merchant: "Apple",
    amount: 11.33,
    type: "debit",
    categoryID: 801,
    category: "Software",
    isPending: false,
    isTransfer: false,
    isExpense: true,
    isEdited: false
)

var transactionListMockData = [Transaction](repeating: transactionMockData, count: 10)
