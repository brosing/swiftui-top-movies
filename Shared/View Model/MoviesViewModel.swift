//
//  MovieViewModel.swift
//  MovieInfo
//
//  Created by singgih on 07/10/20.
//

import Foundation
import Combine

enum MoviesViewState {
    case loading
    case success(movies: MoviesModel)
    case error(error: ErrorRequestModel)
}

class MoviesViewModel: ObservableObject {
    private let type: Category
    private var subscriptions = Set<AnyCancellable>()
    @Published var state: MoviesViewState = .loading
    
    init(type: Category) {
        self.type = type
    }
    
    func discover() {
        MovieService.discover(category: type, params: ["sort_by": "popularity.desc"])
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { value in
                    if case let .failure(error) = value {
                        self.state = .error(error: error)
                    }
                },
                receiveValue: { discover in
                    self.state = .success(movies: discover.results)
                }
            )
            .store(in: &subscriptions)
    }
}
