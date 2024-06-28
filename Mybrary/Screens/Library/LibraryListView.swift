//
//  LibraryListView.swift
//  Mybrary
//
//  Created by Anda Levente on 24/06/2024.
//

import SwiftUI
import SwiftData

struct LibraryListView: View {
    @Environment(\.modelContext) var context
    @State private var isShowingSheet: Bool = false
    @State private var isShowingDetail: Bool = false
    @State private var selectedBook: Book?
    @Query(filter: #Predicate<Book>{ $0.isWishlisted == false }) var libraryData: [Book]
    
    var isReadPage: Bool
    
    var body: some View {
        
        let filtered = libraryData.filter { book in
            isReadPage ? book.isRead : !book.isRead
        }
        
        ZStack {
            NavigationStack {
                List {
                    ForEach(libraryData) { data in
                        if data.isRead == isReadPage {
                            Section{
                                ListCardView(title: data.title, author: data.author)
                                    .onTapGesture {
                                        selectedBook = data
                                        isShowingDetail = true
                                    }
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            context.delete(libraryData[index])
                        }
                    }
                }
                .navigationTitle("Könyvtáram")
                .sheet(isPresented: $isShowingSheet) {
                    AddNewBookSheet(isWishlisted: false, isRead: isReadPage)
                }
                .toolbar {
                    if !filtered.isEmpty {
                        Button("Új könyv", systemImage: "plus"){
                            isShowingSheet = true
                        }
                    }
                }
                .overlay {
                    if filtered.isEmpty {
                        ContentUnavailableView {
                            Image(systemName: "list.bullet.clipboard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(Color.gray)
                                .padding()
                            Text("Nincs könyv ebben a listában")
                            Button("Új könyv") {
                                isShowingSheet = true
                            }
                        }
                    }
                }
            }
            .blur(radius: isShowingDetail ? 5 : 0)
            .disabled(isShowingDetail)
            
            if isShowingDetail {
                BookDetailView(isShowingDetail: $isShowingDetail, book: selectedBook!)
            }
        }
    }
}

#Preview {
    LibraryListView(isReadPage: true)
}
