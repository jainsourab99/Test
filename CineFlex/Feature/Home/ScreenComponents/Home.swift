//
//  Home.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 15/02/25.
//

import SwiftUI

struct Home: View {
    var movieImage: String
    @State private var playAction: Bool = false
    var body: some View {
        VStack {
            Image(movieImage)
                .resizable()
                .scaledToFill()
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .clipped()
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Button(action: {

                            }) {
                                Text(ViewText.addBtn)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.all, ViewPadding.allPadding)
                                    .padding(.horizontal)
                                    .background(Color.white)
                                    .cornerRadius(ViewPadding.radiusSmall)
                            }
                            Button(action: {
                                playAction = true
                            }) {
                                Text(ViewText.playBtn)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.all, ViewPadding.allPadding)
                                    .padding(.horizontal)
                                    .background(Color.white)
                                    .cornerRadius(ViewPadding.radiusSmall)
                            }
                        }
                    }
                    .padding(.bottom, 40)
                }
        }
        .fullScreenCover(isPresented: $playAction) {
            VideoPlayerView(
                video: VideoMetadata(
                    title: "Nature",
                    videoURL: URL(
                        string: "https://www.w3schools.com/html/mov_bbb.mp4")!,
                    thumbnailURL: URL(
                        string: "https://via.placeholder.com/100x60")!
                ))

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
    static let addBtn = "+Add"
    static let playBtn = "Play"
}
