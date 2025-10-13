//
//  AddExpenseViewModel.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import Foundation

@Observable
class HomeViewModel {
    
    var expensies: [Expense] = []
    var totalAmount: Double = 0.00
    let categories: [Category] = Category.data
    var selectedCategory: Category = Category.data[0]
    var amount: String = ""
    var title: String = ""
    var note: String = ""
    
    var errorMessage: String = ""
    var showError: Bool = false
    
    
    func addNewExpense() {
        if validateAddExpenseFields() {
            guard let amountAsDouble = Double(amount) else { return }
            let newExpense = Expense(amount: amountAsDouble, title: title, category: selectedCategory, note: note)
            expensies.append(newExpense)
            totalAmount += amountAsDouble
        }
    }
    
    func validateAddExpenseFields() -> Bool {
        guard let amountAsDouble = Double(amount) else { return false }
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
    
}
