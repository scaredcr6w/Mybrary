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
    var isWishlisted: Bool
    var isRead: Bool
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var price: Int = 0
    @State private var purchaseDate: Date = .now
    @State private var bookDescription: String = ""
    @State private var rating: Int = 0
    @State private var ratingBody: String = ""
    
    @State private var errorMessage = ""
    @State private var isError = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section (header: Text("Könyv adatai")){
                    TextField("Író", text: $author)
                    TextField("Cím", text: $title)
                    TextField("Ár", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "HUF"))
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("Ismertető")) {
                    TextField("Mit tud ez a könyv?", text: $bookDescription)
                        .frame(height: 100)
                }
                if !isWishlisted {
                    Section (header: Text("Egyéb adatok")) {
                        DatePicker("Vásárlás dátuma", selection: $purchaseDate, displayedComponents: .date)
                        
                    }
                    Section(header: Text("Értékelés")) {
                        Picker("Értékelés", selection: $rating){
                            ForEach(1...5, id: \.self){ rate in
                                Text("\(rate)").tag(rate)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        TextField("Fejtsd ki szempontjaidat", text: $ratingBody)
                    }
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
                        let book = Book(author: author,
                                        title: title,
                                        price: price,
                                        purchaseDate: purchaseDate,
                                        bookDescription: bookDescription,
                                        rating: rating,
                                        ratingBody: ratingBody,
                                        isWishlisted: isWishlisted,
                                        isRead: isRead)
                        do {
                            try validateForm(book: book)
                            context.insert(book)
                            dismiss()
                        } catch {
                            isError = true
                            errorMessage = error.localizedDescription
                        }
                    }
                    .alert("Validation Error",
                           isPresented: $isError,
                           actions: {
                        Button("OK", role: .cancel) { }
                    },
                           message: {
                        Text(errorMessage)
                    })

                }
            }
        }
    }
}

#Preview {
    AddNewBookSheet(isWishlisted: false, isRead: false)
}
