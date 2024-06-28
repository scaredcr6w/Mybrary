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
    @State private var isShowingDetail: Bool = false
    @Query(filter: #Predicate<Book>{ $0.isWishlisted }) var wishlistData: [Book]
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(wishlistData) { data in
                        Section {
                            ListCardView(title: data.title, author: data.author)
                                .onTapGesture {
                                    isShowingDetail = true
                                }
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
                .overlay {
                    if wishlistData.isEmpty {
                        ContentUnavailableView {
                            Image(systemName: "list.bullet.clipboard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.gray)
                                .padding()
                            Text("A kívánságlistád üres")
                            Button("Új könyv") {
                                isShowingSheet = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    WishlistView()
}
