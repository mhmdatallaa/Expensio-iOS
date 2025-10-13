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
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Text(String(format: "$%.2f", viewModel.totalAmount))
                    .frame(width: 200, height: 30)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.blue.opacity(0.2))
                    )
                    
                //                ScrollView {
                List {
                    ForEach(viewModel.expensies) { expense in
                        ExpenseRowView(expense: expense)
                            .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))

                    }
                    .onDelete(perform: viewModel.deleteExpense)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color(.systemGroupedBackground))
                .frame(maxWidth: .infinity)
                
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddExpenseSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                    }

                }
            }
            .sheet(isPresented: $isAddExpenseSheetPresented) {
                AddExpenseView(viewModel: viewModel)
            }
        }
//        .searchable(text: $text)
    }
    

}

#Preview {
    HomeView()
}


import SwiftUI

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
            
            VStack(alignment: .leading, spacing: 6) {
                Text(expense.title ?? "")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color.primary)
                Text("⏰ \(String(describing: expense.dateCreated))")
                    .font(.system(size: 14))
                    .foregroundColor(Color.secondary)
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
