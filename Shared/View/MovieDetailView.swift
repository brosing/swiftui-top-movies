//
//  MovieDetailView.swift
//  TestMovie
//
//  Created by singgih on 16/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    let movie: MovieModel
    private let imageURL = URL(string: "https://image.tmdb.org/t/p/original")
    
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            WebImage(url: imageURL?.appendingPathComponent(movie.posterPath))
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            
            Text(movie.releaseDate ?? movie.firstAirDate ?? "")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 7)
                .padding(.horizontal, 14)
                .background(Color.accentColor)
                .clipShape(Capsule())
                .opacity(zoomed ? 0 : 1)
        }
        .navigationTitle(movie.title ?? movie.name ?? "")
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exampleMovie)
    }
}
