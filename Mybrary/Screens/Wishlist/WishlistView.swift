//
//  WishlistView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI

struct WishlistView: View {
    @ObservedObject var viewModel = WishlistViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.wishlistData){ data in
                ListCardView(title: data.title, author: data.author, cover: data.cover)
            }
            .navigationTitle("Kívánságlista")
        }
    }
}

#Preview {
    WishlistView()
}
