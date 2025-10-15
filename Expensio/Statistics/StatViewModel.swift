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
    
    let store = EXPersistenceStore.shared
    
    
    init() {
        getCategoryAmount()
    }
    
    
    
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
            // Remember an emoji for this category if not already set
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
    
    
}
