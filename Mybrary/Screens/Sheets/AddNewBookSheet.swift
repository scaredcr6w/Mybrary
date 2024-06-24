//
//  AddNewBookSheet.swift
//  Mybrary
//
//  Created by Anda Levente on 24/06/2024.
//

import SwiftUI

struct AddNewBookSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var price: Int = 0
    @State private var purchaseDate: Date = .now
    @State var isWishlisted: Bool
    @State var isRead: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Író", text: $author)
                TextField("Cím", text: $title)
                TextField("Ár", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "AUD"))
                    .keyboardType(.decimalPad)
                if !isWishlisted{
                    DatePicker("Vásárlás dátuma", selection: $purchaseDate, displayedComponents: .date)
                }
                
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
                        let book = Book(author: author, title: title, price: price, purchaseDate: purchaseDate, isWishlisted: isWishlisted, isRead: isRead)
                        context.insert(book)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewBookSheet(isWishlisted: true, isRead: false)
}
