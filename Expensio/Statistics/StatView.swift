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
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    
                    // MARK: - Header
                    VStack(spacing: 6) {
                        Text("Expense Summary")
                            .font(.headline)
                        
                        Text("Total: " + String(format: "$%.2f", viewModel.totalAmount))
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(.tint)
                    }
                    .padding(.top)
                    
                    // MARK: - Bar Chart
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Spending by Category")
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(.secondary)
                            .padding(.leading, 8)
                        
                        Chart {
                            ForEach(viewModel.categoriesAmount) { category in
                                BarMark(
                                    x: .value("Category", category.emoji),
                                    y: .value("Amount", category.amount)
                                )
                                .cornerRadius(6)
                                .foregroundStyle(by: .value("Category", category.name))
                            }
                        }
                        .chartLegend(position: .bottom, spacing: 12)
                        .frame(height: 280)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.secondarySystemBackground))
                                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
                        )
                    }
                    
                    // MARK: - Pie Chart
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Spending Distribution")
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(.secondary)
                            .padding(.leading, 8)
                        
                        Chart {
                            ForEach(viewModel.categoriesAmount) { category in
                                SectorMark(
                                    angle: .value("Amount", category.amount),
                                    innerRadius: .ratio(0.55),
                                    angularInset: 1.5
                                )
                                .foregroundStyle(by: .value("Category", category.name))
                            }
                        }
                        .chartLegend(position: .leading, alignment: .center)
                        .frame(height: 260)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.secondarySystemBackground))
                                .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
                        )
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Statistics")
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
