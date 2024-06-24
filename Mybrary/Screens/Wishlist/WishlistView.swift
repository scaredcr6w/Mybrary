//
//  WishlistView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI
import SwiftData

struct WishlistView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingSheet: Bool = false
    @Query(filter: #Predicate<Book>{ $0.isWishlisted }) var wishlistData: [Book]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishlistData) { data in
                    Section{
                        ListCardView(title: data.title, author: data.author)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(wishlistData[index])
                        
                    }
                }
            }
            .navigationTitle("Kívánságlista")
            .sheet(isPresented: $isShowingSheet) {
                AddNewBookSheet(isWishlisted: true, isRead: false)
            }
            .toolbar {
                if !wishlistData.isEmpty {
                    Button("Új könyv", systemImage: "plus"){
                        isShowingSheet = true
                    }
                }
            }
            .overlay{
                if wishlistData.isEmpty {
                    ContentUnavailableView {
                        Text("A kívánságlistád üres")
                        Button("Új könyv") {
                            isShowingSheet = true
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    WishlistView()
}
