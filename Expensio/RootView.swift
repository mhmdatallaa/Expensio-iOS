//
//  RootView.swift
//  Expensio
//
//  Created by Mohamed Atallah on 08/10/2025.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "wallet.bifold") {
                HomeView()
            }
            
            Tab("Stats", systemImage: "chart.bar.xaxis") {
                EmptyView()
            }
            
            Tab("Settings", systemImage: "gear") {
                EmptyView()
            }
        }
    }
}

#Preview {
    RootView()
}
