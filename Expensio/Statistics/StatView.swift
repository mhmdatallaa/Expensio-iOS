//
//  CategoryAmount.swift
//  Expensio
//
//  Created by Mohamed Atallah on 15/10/2025.
//

import SwiftUI
import Charts


struct StatView: View {
    @State private var viewModel = StatViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    VStack {
                        Text("Expenses Amount")
                        Text("Total: " + String(format: "$%.2f", viewModel.totalAmount))
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.bottom, 12)
                    }
                    Chart {
                        ForEach(viewModel.categoriesAmount) { category in
                            BarMark(
                                x: .value("Category", category.emoji),
                                y: .value("Amount", category.amount)
                            )
                            .cornerRadius(12)
                            .foregroundStyle(by: .value("Category", category.name))
                            
                        }
                    }
                    .frame(height: 300)
                    .padding(.bottom, 60)
                    
                    Chart {
                        ForEach(viewModel.categoriesAmount) { category in
                            SectorMark(angle: .value("Amount", category.amount),
                                       innerRadius: .fixed(35),
                                       angularInset: 1,
                            )
                            
                            .foregroundStyle(by: .value("Category", category.name))
                            
                        }
                    }
                    .frame(height: 200)
                    
                }
                .padding()
                .navigationTitle("Expenses Stats")
//                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            viewModel.getCategoryAmount()
            viewModel.getTotalAmount()
        }
        
    }
    
}


#Preview {
    StatView()
}

struct CategoryAmount: Identifiable, Hashable {
    let id = UUID()
    let emoji: String
    var name: String
    var amount: Double
    
    
    // Sample data for previews (can be removed)
    static let sampleData: [CategoryAmount] = [
        CategoryAmount(emoji: "☕️", name: "Food & Drink", amount: 120.0),
        CategoryAmount(emoji: "🚌", name: "Transport", amount: 60.0),
        CategoryAmount(emoji: "🏠", name: "Rent", amount: 500.0),
        CategoryAmount(emoji: "💡", name: "Utilities", amount: 90.0),
        CategoryAmount(emoji: "🛍️", name: "Shopping", amount: 150.0),
        CategoryAmount(emoji: "💊", name: "Healthcare", amount: 45.0),
    ]
}
