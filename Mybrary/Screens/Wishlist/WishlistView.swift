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
    @State private var isShowingDetailSheet: Bool = false
    @State private var isShowingUpdateSheet: Bool = false
    @State private var isShowingDetail: Bool = false
    @State private var bookToDetail: Book?
    @State private var bookToUpdate: Book?
    @Query(filter: #Predicate<Book>{ $0.isWishlisted }) var wishlistData: [Book]
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(wishlistData) { book in
                        Section {
                            ListCardView(title: book.title, author: book.author, coverImage: book.coverImage)
                                .onTapGesture {
                                    bookToDetail = book
                                    isShowingDetail = true
                                }
                                .onLongPressGesture {
                                    bookToUpdate = book
                                }
                                .swipeActions(edge: .leading) {
                                    Button {
                                        book.isWishlisted.toggle()
                                    } label: {
                                        Label("Olvasatlanba", systemImage: "eye.slash")
                                    }
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
                .sheet(isPresented: $isShowingDetailSheet) {
                    AddNewBookSheet(isWishlisted: true, isRead: false)
                }
                .sheet(item: $bookToUpdate) { book in
                    UpdateBookSheet(book: book)
                }
                .toolbar {
                    if !wishlistData.isEmpty {
                        Button("Új könyv", systemImage: "plus"){
                            isShowingDetailSheet = true
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
                                isShowingDetailSheet = true
                            }
                        }
                    }
                }
            }
            .blur(radius: isShowingDetail ? 5 : 0)
            .disabled(isShowingDetail)
            
            if isShowingDetail {
                BookDetailView(isShowingDetail: $isShowingDetail, book: bookToDetail!)
            }
        }
    }
}

#Preview {
    WishlistView()
}
