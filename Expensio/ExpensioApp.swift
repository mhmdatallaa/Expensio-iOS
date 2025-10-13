//
//  ExpensioApp.swift
//  Expensio
//
//  Created by Mohamed Atallah on 05/10/2025.
//

import SwiftUI

@main
struct ExpensioApp: App {
    init() {
        let store = CoreDateStorage()
        EXPersistenceStore.shared.configure(store)
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}
