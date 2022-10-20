//
//  Ext+Double.swift
//  Tracker_SwiftUI_LBTA
//
//  Created by Maxim Hranchenko on 20.10.2022.
//

import Foundation

extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
