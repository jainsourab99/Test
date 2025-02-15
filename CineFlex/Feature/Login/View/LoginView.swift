//
//  LoginView.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 14/02/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack(spacing: 0) {
                ForEach(0..<viewModel.characters.count, id: \.self) { index in
                    Text(String(viewModel.characters[index]))
                        .font(.system(size: 60, weight: .bold, design: .default))
                        .foregroundColor(.red)
                        .offset(viewModel.offsets[index])
                        .opacity(viewModel.opacities[index])
                        .shadow(color: Color.red.opacity(0.8), radius: 10)
                        .onAppear {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.5).delay(Double(index) * 0.1)) {
                                viewModel.offsets[index] = .zero
                                viewModel.opacities[index] = 1
                            }
                        }
                }
            }
            .onTapGesture {
                viewModel.loginToggle = true
            }
        }
        .fullScreenCover(isPresented: $viewModel.loginToggle) {
            MovieList()
        }
    }
    
}

#Preview {
    LoginView()
}
