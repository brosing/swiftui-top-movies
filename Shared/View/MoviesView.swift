//
//  MoviesView.swift
//  TestMovie
//
//  Created by singgih on 15/10/20.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject var viewModel: MoviesViewModel
    
    init(type: Category) {
        self.viewModel = MoviesViewModel(type: type)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top 20")
                .font(.headline)
                .padding(.horizontal, 25)
            
            // Switch based on state
            switch viewModel.state {
            case .loading:
                Text("Loading...")
                    .font(.title)
                
            case .error(let error):
                Text(error.description + error.localizedDescription)
                    .font(.title)
                
            case .success(let movies):
                List(movies) { movie in
                    MovieView(movie: movie).padding(.vertical, 10)
                }
                .listStyle(PlainListStyle())
            }
        }
        .onAppear(perform: viewModel.discover)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoviesView(type: .movie)
        }
    }
}
