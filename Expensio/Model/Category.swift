//
//  Category.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import Foundation


struct StoredCategory: Identifiable, Hashable {
    let id = UUID().uuidString
    let emoji: String
    let name: String
    
    static let data: [StoredCategory] = [
        .init(emoji: "🚌", name: "Transport"),
        .init(emoji: "🏦", name: "Insurance"),
        .init(emoji: "🏠", name: "Home"),
        .init(emoji: "💼", name: "Work"),
        .init(emoji: "🍔", name: "Food & Drink"),
        .init(emoji: "💡", name: "Bills & Utilities"),
        .init(emoji: "🎮", name: "Entertainment"),
        .init(emoji: "🛍️", name: "Shopping"),
        .init(emoji: "💊", name: "Health"),
        .init(emoji: "📚", name: "Education"),
        .init(emoji: "✈️", name: "Travel"),
        .init(emoji: "🐶", name: "Pets"),
        .init(emoji: "🎁", name: "Gifts"),
        .init(emoji: "💰", name: "Savings"),
        .init(emoji: "🧴", name: "Personal Care"),
        .init(emoji: "👨‍👩‍👧", name: "Family"),
        .init(emoji: "🚗", name: "Car"),
        .init(emoji: "🪙", name: "Other")
        ]
}
