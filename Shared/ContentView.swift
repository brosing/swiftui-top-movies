//
//  ContentView.swift
//  Shared
//
//  Created by singgih on 15/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(macOS)
        NavigationView {
            SidebarView()
            Text("Select Category")
            Text("Select Movie")
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: {
                    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                }) {
                    Image(systemName: "sidebar.left")
                }
                .keyboardShortcut("S", modifiers: .command)
            }
        }
        .frame(width: 1000, height: 600)
        #else
        NavigationView {
            TabbarView().navigationTitle("Discover")
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
