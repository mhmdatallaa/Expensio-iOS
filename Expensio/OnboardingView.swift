//
//  OnboardingView.swift
//  Expensio
//
//  Created by Mohamed Atallah on 08/10/2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showRootView: Bool = false
    var body: some View {
//        NavigationView {
            VStack {
                Text("Expensio")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.purple)
                    .padding(.vertical, 40)
//                    .padding(.bottom, 40)
                VStack(spacing: 24) {
                    Image(systemName: "wallet.bifold")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.purple)
                        .padding()
                        .frame(width: 100)
                        .frame(height: 100)
                        .background {
                            Circle()
                                .foregroundStyle(.purple)
                                .opacity(0.2)
                        }
                    
                    Text("Track Your expenses effortlessly")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("Easily manage your daily spending and gain insights into your financial habits.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .opacity(0.8)
                }
                
                Spacer()
                Button {
                    showRootView = true
                } label: {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 80)
                
            }
            .navigationDestination(isPresented: $showRootView) {
                RootView()
            }
        }
                    
//    }
    
}

#Preview {
    OnboardingView()
}
