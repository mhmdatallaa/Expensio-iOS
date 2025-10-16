//
//  DetailView.swift
//  Expensio
//
//  Created by Mohamed Atallah on 16/10/2025.
//

import SwiftUI


import SwiftUI

struct ExpenseDetailView: View {
    var expense: Expense
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Header: Amount
                VStack(spacing: 6) {
                    Text(String(format: "$%.2f", expense.amount))
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.tint)
                    
                    if let date = expense.dateCreated {
                        Text(date.formatted(date: .abbreviated, time: .shortened))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thinMaterial)
                        .shadow(radius: 1)
                        .padding(.horizontal)
                )
                .padding(.top, 10)
                
                // MARK: - Category
                HStack(spacing: 12) {
                    Text(expense.category?.emoji ?? "💸")
                        .font(.system(size: 30))
                        .frame(width: 60, height: 60)
                        .background(Color.accentColor.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(expense.category?.title ?? "Unknown Category")
                            .font(.headline)
                        Text("Category")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.secondarySystemBackground))
                )
                .padding(.horizontal)
                
                // MARK: - Note Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Note")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text(expense.note?.isEmpty == false ? expense.note! : "No notes provided.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.secondarySystemBackground))
                        )
                }
                .padding(.horizontal)
                
                Spacer(minLength: 30)
            }
            .padding(.vertical)
            .background(Color(.systemGroupedBackground))
        }
        .navigationTitle(expense.title ?? "Expense Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExpenseDetailView(expense: Expense())
}
