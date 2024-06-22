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
    @Query var wishlistData: [Book]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 16){
                    Spacer()
                    ForEach(wishlistData) { data in
                        ListCardView(title: data.title, author: data.author)
                            .background(Color.clear)
                    }
                    .onDelete{ indexSet in
                        for i in indexSet {
                            context.delete(wishlistData[i])
                        }
                    }
                }
            }
            .navigationTitle("Kívánságlista")
            .sheet(isPresented: $isShowingSheet) {
                AddNewBookToWishlist()
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
                    ContentUnavailableView{
                        Text("A kívánságlistád üres")
                        Button("Új könyv"){
                            isShowingSheet = true
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AddNewBookToWishlist: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var price: Int = 0
    @State private var purchaseDate: Date = .now
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Író", text: $author)
                TextField("Cím", text: $title)
                TextField("Ár", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "AUD"))
                    .keyboardType(.decimalPad)
                DatePicker("Vásárlás dátuma", selection: $purchaseDate, displayedComponents: .date)
            }
            .navigationTitle("Új könyv")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Mégsem"){
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Mentés"){
                        let book = Book(author: author, title: title, price: price, purchaseDate: purchaseDate)
                        context.insert(book)
                        dismiss()
                    }
                }
            }
        }
    }
    
}


#Preview {
    WishlistView()
}
