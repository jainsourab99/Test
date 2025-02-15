//
//  MoviesDetailInfo.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 14/02/25.
//

import SwiftUI

struct MoviesDetailInfo: View {
    var title:String
    @StateObject  var viewModel: VideoPlayerViewModel
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading,ViewPadding.leadingPadding)
                Spacer()
            }
            
            HStack {
                Text(ViewText.movieInfoSummary)
                    .font(.body)
                    .foregroundColor(.white)
                    .privacySensitive()
                    .padding(.horizontal)
            }
            HStack {
                Text(ViewText.movieType)
                    .foregroundColor(.gray)
                    .padding(.leading,ViewPadding.leadingPadding)
                Spacer()
            }
            HStack {
                Button(action: {
                    viewModel.player.seek(to: .zero) { _ in
                         viewModel.player.play()
                     }
                }) {
                    Text(ViewText.movieBeginningBtn)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.all, ViewPadding.allPadding)
                        .background(Color.gray)
                        .cornerRadius(ViewPadding.radiusSmall)
                }
                Button(action: {

                }) {
                    Text(ViewText.movieDetailsBtn)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.all, ViewPadding.allPadding)
                        .background(Color.gray)
                        .cornerRadius(ViewPadding.radiusSmall)
                }
            }
            
        }
    }
}

// MARK: - ViewPadding
private struct ViewPadding {
    static let leadingPadding: CGFloat = 25
    static let allPadding: CGFloat = 8
    static let radiusSmall: CGFloat = 4
}
// MARK: - ViewText
private struct ViewText {
    static let movieInfoSummary = "This animated movie features a white bear on an adventure, with beautiful butterflies fluttering around. It's a delightful and surprising journey that's definitely worth watching."
    static let movieType = "animation .10sec"
    static let movieBeginningBtn = "From Beginning"
    static let movieDetailsBtn = "Details"
    
    
}
