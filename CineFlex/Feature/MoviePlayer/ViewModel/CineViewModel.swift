//
//  CineViewModel.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 14/02/25.
//

import Foundation
import Combine
import AVKit

struct VideoMetadata {
    let title: String
    let videoURL: URL
    let thumbnailURL: URL
}

class VideoPlayerViewModel: ObservableObject {
    @Published var thumbnailImage: UIImage?
    @Published var isPlaying: Bool = false
    var player: AVPlayer
    private var cancellables = Set<AnyCancellable>()

    init(videoURL: URL) {
        self.player = AVPlayer(url: videoURL)
        self.fetchThumbnail()
        self.observePlayerStatus()
    }

    var playerLayer: AVPlayerLayer {
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill
        return layer
    }

    private func fetchThumbnail() {
        guard let asset = player.currentItem?.asset as? AVURLAsset else {
            print("Error: Asset is not an AVURLAsset")
            return
        }
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true

        DispatchQueue.global().async {
            let time = CMTime(seconds: 5, preferredTimescale: 600) // Example time
            do {
                let cgImage = try imageGenerator.copyCGImage(at: time, actualTime: nil)
                DispatchQueue.main.async {
                    self.thumbnailImage = UIImage(cgImage: cgImage)
                }
            } catch {
                print("Error generating thumbnail: \(error)")
            }
        }
    }

    private func observePlayerStatus() {
        player.publisher(for: \.timeControlStatus)
            .sink { [weak self] status in
                self?.isPlaying = (status == .playing)
            }
            .store(in: &cancellables)
    }
}
