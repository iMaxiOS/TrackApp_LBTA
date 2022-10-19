//
//  Tracker_SwiftUI_LBTAApp.swift
//  Tracker_SwiftUI_LBTA
//
//  Created by Maxim Hranchenko on 19.10.2022.
//

import SwiftUI

@main
struct Tracker_SwiftUI_LBTAApp: App {
    @StateObject var transactionsListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionsListVM)
        }
    }
}
