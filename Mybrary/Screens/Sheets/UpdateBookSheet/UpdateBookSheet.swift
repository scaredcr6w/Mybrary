//
//  UpdateBookSheet.swift
//  Mybrary
//
//  Created by Anda Levente on 07/07/2024.
//

import SwiftUI
import PhotosUI

struct UpdateBookSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @ObservedObject private var viewModel = BookFormValidation()
    
    @Bindable var book: Book
    
    @State private var selectedPhotoData: Data?
    @State private var selectedPhoto: PhotosPickerItem?
    
    @State private var errorMessage = ""
    @State private var isError = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Író", text: $book.author)
                    TextField("Cím", text: $book.title)
                    TextField("Ár", value: $book.price,
                              format: .currency(code: Locale.current.currency?.identifier ?? "HUF")
                    )
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("Ismertető")) {
                    TextEditor(text: $book.bookDescription)
                        .frame(height: 100)
                }
                
                if !book.isWishlisted {
                    Section (header: Text("Egyéb adatok")) {
                        DatePicker("Vásárlás dátuma",
                                   selection: $book.purchaseDate,
                                   displayedComponents: .date)
                        
                    }
                    Section(header: Text("Értékelés")) {
                        Picker("Értékelés", selection: $book.rating) {
                            ForEach(1...5, id: \.self){ rate in
                                Text("\(rate)").tag(rate)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        TextEditor(text: $book.ratingBody)
                            .frame(height: 100)
                    }
                }
                
                Section {
                    if let selectedPhotoData,
                       let uiImage = UIImage(data: selectedPhotoData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                    }
                    
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Text("Válassz képet a fotóidból...")
                    }
                }
            }
            .navigationTitle("Szerkesztés")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Mégsem"){
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Mentés") {
                        let book = Book(author: book.author,
                                        title: book.title,
                                        price: book.price,
                                        purchaseDate: book.purchaseDate,
                                        bookDescription: book.bookDescription,
                                        rating: book.rating,
                                        ratingBody: book.ratingBody,
                                        isWishlisted: book.isWishlisted,
                                        isRead: book.isRead,
                                        coverImage: selectedPhotoData)
                        do {
                            try viewModel.validateForm(book: book)
                            dismiss()
                        } catch {
                            isError = true
                            errorMessage = error.localizedDescription
                        }
                    }
                    .alert("Hiba!",
                           isPresented: $isError,
                           actions: {
                        Button("OK", role: .cancel) { }
                    },
                           message: {
                        Text(errorMessage)
                    })

                }
            }
            .task(id: selectedPhoto) {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    selectedPhotoData = data
                }
            }
        }
    }
}

//#Preview {
//    UpdateBookSheet(book: )
//}
