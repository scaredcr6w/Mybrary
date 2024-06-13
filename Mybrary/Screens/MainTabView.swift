//
//  MainTabView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            HomepageView()
                .tabItem {
                    Label("Kezdőlap", systemImage: "house")
                }
            
            LibraryView()
                .tabItem {
                    Label("Könytáram", systemImage: "book")
                }
            
            WishlistView()
                .tabItem {
                    Label("Kívánságlistám", systemImage: "list.clipboard")
                }
        }
    }
}

#Preview {
    MainTabView()
}
