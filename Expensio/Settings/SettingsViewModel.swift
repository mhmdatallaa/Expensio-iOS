//
//  SettingsViewMode.swift
//  Expensio
//
//  Created by Mohamed Atallah on 16/10/2025.
//

import Foundation

@Observable
class SettingsViewModel {
    private let store = EXPersistenceStore.shared
    
    func resetData() {
        store.resetData()
    }
}
