//
//  AddExpenseViewModel.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import Foundation

@Observable
class HomeViewModel {
    
    private let store = EXPersistenceStore.shared
    
    var user: User!
    var expensies: [Expense] = []
    var totalAmount: Double = 0.00
    var selectedCategory = StoredCategory.data[0]
    var amount: String = ""
    var title: String = ""
    var note: String = ""
    
    var errorMessage: String = ""
    var showError: Bool = false
    
    init() {
        self.user = store.getUsers().first
        getExpenses()
    }
    
    
    func addNewExpense() {
        if validateAddExpenseFields() {
            guard let amountAsDouble = Double(amount) else {
                showError = true
                errorMessage = "The amount should should be a valid number"
                return
            }
            totalAmount += amountAsDouble
            store.updateUser(totalExpense: totalAmount, expenses: expensies)
            let category = store.addNewCategory(emoji: selectedCategory.emoji, name: selectedCategory.name)
            store.addNewExpense(amount: amountAsDouble, title: title, category: category, note: note)
            getExpenses()
        }
    }
    
    
    func validateAddExpenseFields() -> Bool {
        guard let amountAsDouble = Double(amount) else {
            showError = true
            errorMessage = "Your amount should be a valid number"
            return false
        }
        if amountAsDouble < 0 ||
            title.isEmpty {
            showError = true
            errorMessage = "Your amount should have value greater that 0,and your expense should have a title"
            return false
        }
        return true
    }
    
    func resetFields() {
        amount = ""
        title = ""
        note = ""
    }
    
    func getExpenses() {
        let expenses = store.getExpenses()
        self.expensies = expenses
        self.totalAmount = user.totalExpense
    }
    
    func deleteExpense(insets: IndexSet) {
        guard let indexPath = insets.first else { return }
        let expnese = expensies[indexPath]
        expensies.remove(at: indexPath)
        totalAmount -= expnese.amount
        store.deleteExpense(expnese)
        store.updateUser(totalExpense: totalAmount, expenses: expensies)
    }
    
}
