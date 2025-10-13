//
//  CoreDateStorage.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import CoreData

class CoreDateStorage: EXPersisting {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Expensio")
        container.loadPersistentStores { description, error in
            guard let error else { return }
        }
    }
    
    
    func add(_ item: Expense) {
        // Adding expense Login
    }
    
    func remove(_ item: Expense) {
        // Removing expense logic
    }
    
    func saveCahangesInStorage() {
        // save changes whether after adding or removing
    }
    
    
}
