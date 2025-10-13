//
//  Category.swift
//  Expensio
//
//  Created by Mohamed Atallah on 13/10/2025.
//

import Foundation


struct Category: Identifiable, Hashable {
    let id = UUID()
    let emoji: String
    let title: String
    
    static let data: [Category] = [
            .init(emoji: "🚌", title: "Transport"),
            .init(emoji: "🏦", title: "Insurance"),
            .init(emoji: "🏠", title: "Home"),
            .init(emoji: "💼", title: "Work"),
            .init(emoji: "🍔", title: "Food & Drink"),
            .init(emoji: "💡", title: "Bills & Utilities"),
            .init(emoji: "🎮", title: "Entertainment"),
            .init(emoji: "🛍️", title: "Shopping"),
            .init(emoji: "💊", title: "Health"),
            .init(emoji: "📚", title: "Education"),
            .init(emoji: "✈️", title: "Travel"),
            .init(emoji: "🐶", title: "Pets"),
            .init(emoji: "🎁", title: "Gifts"),
            .init(emoji: "💰", title: "Savings"),
            .init(emoji: "🧴", title: "Personal Care"),
            .init(emoji: "👨‍👩‍👧", title: "Family"),
            .init(emoji: "🚗", title: "Car"),
            .init(emoji: "🪙", title: "Other")
        ]
}
