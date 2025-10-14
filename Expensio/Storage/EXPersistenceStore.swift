//
//  EXPersistenceStore.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import Foundation

class EXPersistenceStore {
    
    static let shared = EXPersistenceStore()
    var store: ExStore?
    private init() { }
    
    func configure(_ store: ExStore) {
        self.store = store
    }
    
    func getExpenses() -> [Expense] {
        guard let store else {
            Log.error("Please configure the Persistence store with a store")
            return []
        }
        return store.fetchItems()
    }
    

    
//    func getCategories() -> [Category] {
//        guard let store else {
//            Log.error("Please configure the Persistence store with a store")
//            return []
//        }
//        return store.fetchItems()
//    }
    
    func getUsers() -> [User] {
        guard let store else {
            Log.error("Please configure the Persistence store with a store")
            return []
        }
        return store.fetchItems()
    }
    
    func addUser(totalExpense: Double, expenses: [Expense]) {
        let users = getUsers()
        if users.count >= 1 {
            return
        } else {
            if let store {
                store.addUser(totalExpense: totalExpense, expenses: expenses)
            }
        }
    }
    
    func updateUser(totalExpense: Double, expenses: [Expense]) {
        store?.updateUser(totalExpense: totalExpense, expenses: expenses)
    }
    
    func addNewExpense(amount: Double, title: String, category: Category, note: String) {
        guard let store else {
            Log.error("Please configure the Persistence store with a store")
            return
        }
        store.addExpense(amount: amount, title: title, category: category, note: note)
    }
    
    
    @discardableResult
    func addNewCategory(emoji: String, name: String) -> Category {
        guard let store else {
            Log.error("Please configure the Persistence store with a store")
            return Category()
        }
        return store.addCategory(emoji: emoji, name: name)
    }
    
    func deleteExpense(_ expense: Expense) {
        guard let store else {
            Log.error("Please configure the Persistence store with a store")
            return
        }
        store.delete(expense)
    }
}
