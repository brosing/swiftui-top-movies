//
//  MovieView.swift
//  TestMovie
//
//  Created by singgih on 15/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieView: View {
    let movie: MovieModel
    private let imageURL = URL(string: "https://image.tmdb.org/t/p/w500")
    
    var body: some View {
        NavigationLink(
            destination: MovieDetailView(movie: movie),
            label: { contentView }
        )
    }
    
    private var contentView: some View {
        HStack {
            WebImage(url: imageURL?.appendingPathComponent(movie.posterPath))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .clipped()
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(movie.title ?? movie.name ?? "-")
                    .font(.headline)
                
                Text(movie.releaseDate ?? movie.firstAirDate ?? "-")
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: exampleMovie)
            .previewLayout(.sizeThatFits)
    }
}
