//
//  SettingsView.swift
//  Expensio
//
//  Created by Mohamed Atallah on 16/10/2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var viewModel = SettingsViewModel()
    @State private var showAlert = false
    var body: some View {
        NavigationView {
//            VStack(alignment: .center) {
                Form {
                    Section("Apperance") {
                        Toggle("Dark Mode", isOn: $isDarkMode)
                    }
                    Section("Data") {
                        Button {
                            showAlert.toggle()
                        } label: {
                            Text("ResetData")
                                .foregroundStyle(.red)
                            
                        }
                        .padding(.leading, 125)
                    }
                    Section("About") {
                        VStack(alignment: .leading) {
                            Text("Expensio")
                                .font(.title3)
                            Text("Version 0.0.0")
                                .font(.callout)
                                .fontWeight(.ultraLight)
                        }
                    }
                    
//                }
            }
            .navigationTitle("Settings")
            .alert("Are you sure you want to reset? all your data will be deleted.", isPresented: $showAlert) {
                Button("Sure", role: .destructive) {
                    viewModel.resetData()
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
}

#Preview {
    SettingsView()
}
