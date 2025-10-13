//
//  AddExpenseView.swift
//  Expensio
//
//  Created by Mohamed Atallah on 12/10/2025.
//

import SwiftUI


struct AddExpenseView: View {
    
    @Bindable var viewModel: HomeViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        VStack {
                            Text("Amount")
                                .font(.callout)
                                .opacity(0.7)
                            TextField("$ 0.00", text: $viewModel.amount)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.center)
                                .font(.largeTitle)
                        }
                    }
                    .padding(.horizontal)
                    Section("") {
                        TextField("Title: ex: Coffee with friends", text: $viewModel.title)
                            .padding(.leading)
                        Picker("Category", selection: $viewModel.selectedCategory) {
                            ForEach(StoredCategory.data) { category in
                                    Text("\(category.emoji) \(category.name)").tag(category)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text("Optional note")
                                .font(.caption)
                                .opacity(0.6)

                            TextEditor(text: $viewModel.note)
                                .frame(height: 50)
                                .font(.callout)
                        }
                        .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text("Quick Categories")
                                .font(.system(size: 14, weight: .semibold))
                                .opacity(0.7)
                            
                            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 4), spacing: 16) {
                                ForEach(StoredCategory.data[0..<4]) { category in
                                    QuickCategoryItemView(categoryItem: category, selectedCategory: $viewModel.selectedCategory).tag(category)
                                        .onTapGesture {
                                            viewModel.selectedCategory = category
                                        }
                                }
                            }
                        }
                        
                    }
                }
//                .padding(.top)
                Button {
                    viewModel.addNewExpense()
                    if !viewModel.showError {
                        viewModel.resetFields()
                        dismiss()
                    }
                } label: {
                    Text("Add")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal, 40)
                        .padding(.bottom)
                }
                
            }
            .navigationTitle("New expense")
            .alert(viewModel.errorMessage, isPresented: $viewModel.showError) {
                Button("Ok") { }
            }
        }
    }
}

#Preview {
    AddExpenseView(viewModel: HomeViewModel())
}


// MARK: - Quick Category Item Component
struct QuickCategoryItemView: View {
    let categoryItem: StoredCategory
    @Binding var selectedCategory: StoredCategory

    var body: some View {
        VStack(spacing: 4) {
            Text(categoryItem.emoji)
                .font(.system(size: 28))
            Text(categoryItem.name)
                .font(.system(size: 12))
                .fontWeight(categoryItem.id == selectedCategory.id ? .semibold : .regular)
                .foregroundColor(categoryItem.id == selectedCategory.id ? .blue : .secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(categoryItem.id == selectedCategory.id ? Color.blue.opacity(0.2) : Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(categoryItem.id == selectedCategory.id ? 0 : 0.1), radius: 4)
        
    }
}
