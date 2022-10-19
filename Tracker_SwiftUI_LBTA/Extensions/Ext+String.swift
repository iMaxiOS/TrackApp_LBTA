//
//  Ext+String.swift
//  Tracker_SwiftUI_LBTA
//
//  Created by Maxim Hranchenko on 19.10.2022.
//

import Foundation

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.dateFormatter.date(from: self) else { return Date() }
        return parsedDate
    }
}
