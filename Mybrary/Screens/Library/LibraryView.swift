//
//  LibraryView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack{
            CardView(cardTitle: "Olvasott",
                     cardDescription: "",
                     cardImage: "bookCardRead")
            
            CardView(cardTitle: "Olvasatlan",
                     cardDescription: "",
                     cardImage: "bookCardNotRead")
        }
        .padding()
    }
        
}

#Preview {
    LibraryView()
}
