//
//  AddNewBookSheet.swift
//  Mybrary
//
//  Created by Anda Levente on 24/06/2024.
//

import SwiftUI
import PhotosUI

struct AddNewBookSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @ObservedObject private var viewModel = BookFormValidation()
    var isWishlisted: Bool
    var isRead: Bool
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var price: Int = 0
    @State private var purchaseDate: Date = .now
    @State private var bookDescription: String = ""
    @State private var rating: Int = 0
    @State private var ratingBody: String = ""
    
    @State private var selectedPhotoData: Data?
    @State private var selectedPhoto: PhotosPickerItem?
    
    @State private var errorMessage = ""
    @State private var isError = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section (header: Text("Könyv adatai")) {
                    TextField("Író", text: $author)
                    TextField("Cím", text: $title)
                    TextField("Ár", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "HUF"))
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("Ismertető")) {
                    TextEditor(text: $bookDescription)
                        .frame(height: 100)
                }
                
                if !isWishlisted {
                    Section (header: Text("Egyéb adatok")) {
                        DatePicker("Vásárlás dátuma", selection: $purchaseDate, displayedComponents: .date)
                        
                    }
                    Section(header: Text("Értékelés")) {
                        Picker("Értékelés", selection: $rating) {
                            ForEach(1...5, id: \.self){ rate in
                                Text("\(rate)").tag(rate)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        TextEditor(text: $ratingBody)
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
                                        isRead: isRead,
                                        coverImage: selectedPhotoData)
                        do {
                            try viewModel.validateForm(book: book)
                            context.insert(book)
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

#Preview {
    AddNewBookSheet(isWishlisted: false, isRead: false)
}
