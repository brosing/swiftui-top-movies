//
//  TabBarView.swift
//  TestMovie
//
//  Created by singgih on 16/10/20.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            ForEach(Category.allCases, id: \.self) { category in
                MoviesView(type: category).tabItem {
                    let systemName = category == .tv
                        ? "tv.fill"
                        : "play.fill"
                    
                    Image(systemName: systemName)
                    Text(category.rawValue.uppercased())
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
