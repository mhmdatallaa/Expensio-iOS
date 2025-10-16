//
//  StatViewModel.swift
//  Expensio
//
//  Created by Mohamed Atallah on 15/10/2025.
//

import Foundation

@Observable
class StatViewModel {
    var categoriesAmount: [CategoryAmount] = []
    var totalAmount: Double = 0.0
    
    let store = EXPersistenceStore.shared
    
    
    
    func getCategoryAmount() {
        let expenses = store.getExpenses()
        // Group expenses by category title (fallback to "Unknown") and sum amounts
        var totalsByCategory: [String: Double] = [:]
        var emojiByCategory: [String: String] = [:]
        
        for expense in expenses {
            let title = expense.category?.title ?? "Unknown"
            let emoji = expense.category?.emoji ?? "💸"
            let amount = expense.amount
            
            totalsByCategory[title, default: 0] += amount
            
            if emojiByCategory[title] == nil {
                emojiByCategory[title] = emoji
            }
        }
        // Map to CategoryAmount
        let mapped: [CategoryAmount] = totalsByCategory.map { (title, total) in
            let emoji = emojiByCategory[title] ?? "💸"
            return CategoryAmount(emoji: emoji, name: title, amount: total)
        }        
        self.categoriesAmount = mapped
    }
    
    func getTotalAmount() {
        guard let user = store.getUsers().first else { return }
        totalAmount = user.totalExpense
    }
    
}
