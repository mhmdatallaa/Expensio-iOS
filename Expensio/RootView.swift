//
//  RootView.swift
//  Expensio
//
//  Created by Mohamed Atallah on 08/10/2025.
//

import SwiftUI

@available(iOS 18.0, *)
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
    if #available(iOS 18.0, *) {
        RootView()
    } else {
        // Fallback on earlier versions
    }
}
