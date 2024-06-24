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
    @State var isReadPage: Bool
    @Query(filter: #Predicate<Book>{ $0.isWishlisted == false })
    var libraryData: [Book]
    
    var body: some View {
        let filtered = libraryData.filter { book in
            isReadPage ? book.isRead : !book.isRead
        }
        
        NavigationStack {
            List {
                ForEach(libraryData) { data in
                    if data.isRead == isReadPage {
                        Section{
                            ListCardView(title: data.title, author: data.author)
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
            .overlay{
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
    }
}

#Preview {
    LibraryListView(isReadPage: true)
}
