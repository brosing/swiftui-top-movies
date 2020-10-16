//
//  SideBarView.swift
//  TestMovie
//
//  Created by singgih on 16/10/20.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        List(Category.allCases, id: \.self) { category in
            NavigationLink(
                destination: MoviesView(type: category),
                label: {
                    let systemName = category == .tv
                        ? "tv.fill"
                        : "play.fill"
                    
                    Label(
                        title: { Text(category.rawValue) },
                        icon: { Image(systemName: systemName) }
                    )
                }
            )
            .padding(.vertical, 10)
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 100)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
