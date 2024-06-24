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
                if !libraryData.isEmpty {
                    Button("Új könyv", systemImage: "plus"){
                        isShowingSheet = true
                    }
                }
            }
            .overlay{
                if libraryData.isEmpty {
                    ContentUnavailableView {
                        Text("A könyvtárad üres")
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
    LibraryListView(isReadPage: true)
}
