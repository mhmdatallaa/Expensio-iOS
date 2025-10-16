//
//  ExpensioApp.swift
//  Expensio
//
//  Created by Mohamed Atallah on 05/10/2025.
//

import SwiftUI

@main
struct ExpensioApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    init() {
        let store = CoreDateStorage()
        EXPersistenceStore.shared.configure(store)
        EXPersistenceStore.shared.addUser(totalExpense: 0.00, expenses: [])
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}
