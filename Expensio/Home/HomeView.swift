//
//  HomeView.swift
//  Expensio
//
//  Created by Mohamed Atallah on 08/10/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    @State private var isAddExpenseSheetPresented = false
    @State private var showExpenseDetailView = false
    @State private var selectedExpense: Expense? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // MARK: - Header: Total Amount
                VStack(spacing: 6) {
                    Text("Total Balance")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(String(format: "$%.2f", viewModel.totalAmount))
                        .font(.largeTitle.bold())
                        .foregroundStyle(.tint)
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thinMaterial)
                        .shadow(radius: 2)
                )
                .padding(.bottom, 8)
                .padding(.horizontal, 60 )

                
                // MARK: - Expenses List
                if viewModel.expensies.isEmpty {
                    ContentUnavailableView(
                        "No Expenses Yet",
                        systemImage: "tray",
                        description: Text("Tap the plus button to add your first expense.")
                    )
                    .padding(.top, 50)
                } else {
                    List {
                        ForEach(viewModel.expensies) { expense in
                            ExpenseRowView(expense: expense)
                                .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                                .onTapGesture {
                                    segue(expense: expense)
                                }
                            
                        }
                        .onDelete(perform: viewModel.deleteExpense)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color(.systemGroupedBackground))
                    .frame(maxWidth: .infinity)
                }
                    
                }
//            .padding(.horizontal)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddExpenseSheetPresented = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                    }
                    .tint(.accentColor)
                    .padding()
                }
            }
            .sheet(isPresented: $isAddExpenseSheetPresented) {
                AddExpenseView(viewModel: viewModel)
            }
            .navigationDestination(isPresented: $showExpenseDetailView) {
                ExpenseDetailView(expense: selectedExpense ?? Expense())
            }
            .onAppear {
                viewModel.getExpenses()
            }
        }
    }
    
    private func segue(expense: Expense) {
        selectedExpense = expense
        showExpenseDetailView = true
    }
}

#Preview {
    HomeView()
}



struct ExpenseRowView: View {
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.category?.emoji ?? "")
                .font(.system(size: 26))
                .foregroundColor(Color.accentColor)
                .frame(width: 50, height: 50)
                .background(
                    Color.accentColor.opacity(0.15)
                )
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(expense.title ?? "Untitled")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                if let date = expense.dateCreated {
                    Text(date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            Text(String(format: "$%.2f", expense.amount))
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.accentColor)
        }
        .padding(.vertical, 14)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.secondarySystemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}
