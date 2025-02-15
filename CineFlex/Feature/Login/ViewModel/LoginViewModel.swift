//
//  LoginViewModel.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 14/02/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var loginToggle: Bool = false
    @Published var characters: [Character] = Array("CINEFIEX")
    @Published var offsets: [CGSize] = Array(repeating: CGSize(width: 0, height: -200), count: 8)
    @Published var opacities: [Double] = Array(repeating: 0, count: 8)
}
