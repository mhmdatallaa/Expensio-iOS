//
//  EXPersisting.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import CoreData

protocol ExStore {
    func fetchItems<T: NSFetchRequestResult>() -> [T]
    func addUser(totalExpense: Double, expenses: [Expense])
    func updateUser(totalExpense: Double, expenses: [Expense])
    func addExpense(amount: Double, title: String, category: Category, note: String)
    func addCategory(emoji: String, name: String) -> Category
    func delete<T: NSManagedObject>(_ item: T)
    func saveCahangesInStorage()
}
