//
//  VideoPlayerView.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 14/02/25.
//

import SwiftUI
import AVKit
struct VideoPlayerView: View {
    @StateObject  var viewModel: VideoPlayerViewModel
    let video: VideoMetadata
    @State var movieInfo: Bool = false
    @State var movieInSight: Bool = false
    @State var moviePlay: Bool = false

    init(video: VideoMetadata) {
        _viewModel = StateObject(
            wrappedValue: VideoPlayerViewModel(videoURL: video.videoURL))
        self.video = video
    }

    var body: some View {
        VStack {
            VideoPlayer(player: viewModel.player)
                .ignoresSafeArea()
                .overlay {
                    MovieLogo
                        .padding(.top, -ViewPadding.topPadding)
                }
                
            if !viewModel.isPlaying {
                MoviesDetail
                    .padding(.bottom, ViewPadding.bottomPadding)
                MoviesDetailAction
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
        .onTapGesture {
            movieInfo = false
            movieInSight = false
            moviePlay = false
        }
    }

    private var MovieLogo: some View {
        HStack {
            if let thumbnail = viewModel.thumbnailImage {
                Image(uiImage: thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(width: ViewPadding.frameSmall, height: ViewPadding.frameSmall)
                    .clipShape(Circle())
                    .transition(.opacity)
            }
            Text(video.title)
                .font(.subheadline)
                .foregroundColor(.white)
            Spacer()
        }
    }

    // MoviesDetail Display
    private var MoviesDetail: some View {
        HStack {
            Button(action: {
                movieInfo = true
                movieInSight = false
                moviePlay = false
            }) {
                Text(ViewText.movieInfoBtn)
                    .font(.headline)
                    .foregroundColor(movieInfo ? .black : .white)
                    .padding(.all, ViewPadding.allPadding)
                    .background(movieInfo ? Color.white : Color.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: ViewPadding.radiusSmall)
                            .stroke(Color.white, lineWidth: 0.5)
                    )
            }
            Button(action: {
                movieInfo = false
                movieInSight = true
                moviePlay = false
            }) {
                Text(ViewText.movieInSightBtn)
                    .font(.headline)
                    .foregroundColor(movieInSight ? .black : .white)
                    .padding(.all, ViewPadding.allPadding)
                    .background(
                        movieInSight ? Color.white : Color.black
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: ViewPadding.radiusSmall)
                            .stroke(Color.white, lineWidth: 0.5)
                    )
            }
            Button(action: {
                movieInfo = false
                movieInSight = false
                moviePlay = true
               viewModel.player.play()
            }) {
                Text(ViewText.movieContinueBtn)
                    .font(.headline)
                    .foregroundColor(moviePlay ? .black : .white)
                    .padding(.all, ViewPadding.allPadding)
                    .background(moviePlay ? Color.white : Color.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: ViewPadding.radiusSmall)
                            .stroke(Color.white, lineWidth: 0.5)
                    )
            }
        }
    }

    private var MoviesDetailAction: some View {
        VStack {
            if movieInfo {
                MoviesDetailInfo(title: video.title, viewModel: viewModel)
            }
            if movieInSight {
                MovieInSight()
            }
        }
        .padding(.bottom, ViewPadding.bottomPadding)
    }
}

// MARK: - ViewPadding
private struct ViewPadding {
    static let topPadding: CGFloat = 150
    static let bottomPadding: CGFloat = 40
    static let allPadding: CGFloat = 4
    static let radiusSmall: CGFloat = 4
    static let frameSmall: CGFloat = 30
}

// MARK: - ViewText
private struct ViewText {
    static let movieInfoBtn = "Info"
    static let movieInSightBtn = "InSight"
    static let movieContinueBtn = "Continue Watching"
}
