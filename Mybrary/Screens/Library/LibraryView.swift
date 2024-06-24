//
//  LibraryView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationStack{
            LazyVStack(spacing: 16){
                NavigationLink(destination: LibraryListView(isReadPage: true)) {
                    WideCardView(cardTitle: "Olvasott",
                                 cardDescription: "",
                                 cardImage: "bookCardRead")
                }
                NavigationLink(destination: LibraryListView(isReadPage: false)) {
                    WideCardView(cardTitle: "Olvasatlan",
                                 cardDescription: "",
                                 cardImage: "bookCardNotRead")
                }
            }
            .navigationTitle("Könyvtáram")
        }
    }
        
}

#Preview {
    LibraryView()
}
