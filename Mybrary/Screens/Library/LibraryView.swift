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
                WideCardView(cardTitle: "Olvasott",
                             cardDescription: "",
                             cardImage: "bookCardRead")
                
                WideCardView(cardTitle: "Olvasatlan",
                             cardDescription: "",
                             cardImage: "bookCardNotRead")
            }
            .navigationTitle("Könyvtáram")
        }
    }
        
}

#Preview {
    LibraryView()
}
