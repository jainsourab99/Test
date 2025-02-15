//
//  MovieInSight.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 14/02/25.
//

import SwiftUI

struct MovieInSight: View {
    var body: some View {
        VStack{
            Text(ViewText.insightHeader)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(ViewText.insightMessage)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
        .padding(.bottom , ViewPadding.bottomPadding)
    }
}
// MARK: - ViewPadding
private struct ViewPadding {
    static let bottomPadding: CGFloat = 60
}
// MARK: - ViewText
private struct ViewText {
    static let insightHeader = "Inside This Scene"
    static let insightMessage = "when available, InSight will show you information about the actors or music in a scene"
}
