//
//  MovieList.swift
//  CineFlex
//
//  Created by ganesh.shankar02 on 15/02/25.
//

import SwiftUI

struct MovieList: View {
    let movies = ["SmallFoot", "Light", "Gromit"]
        @State private var currentIndex = 0
        
        var body: some View {
            ZStack {
                ForEach(0..<movies.count, id: \.self) { index in
                    Home(movieImage: movies[index])
                        .offset(x: CGFloat(index - currentIndex) * UIScreen.main.bounds.width)
                        .ignoresSafeArea()
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -50 {
                            currentIndex = (currentIndex + 1) % movies.count
                        } else if value.translation.width > 50 {
                            currentIndex = (currentIndex - 1 + movies.count) % movies.count
                        }
                    }
            )
        }
}

#Preview {
    MovieList()
}
