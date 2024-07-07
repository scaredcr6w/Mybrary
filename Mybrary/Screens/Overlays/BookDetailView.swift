//
//  BookDetailView.swift
//  Mybrary
//
//  Created by Anda Levente on 27/06/2024.
//

import SwiftUI

struct BookDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @Binding var isShowingDetail: Bool
    
    var book: Book?
    
    var body: some View {
        VStack {
            ScrollView {
                if let coverImage = book?.coverImage,
                   let uiImage = UIImage(data: coverImage) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 320, height: 200)
                        .clipped()
                        .padding(.bottom)
                } else {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 320, height: 200)
                        .foregroundStyle(Color.gray)
                        .padding(.bottom)
                }
                
                VStack {
                    Text(book?.title ?? "")
                        .bold()
                        .font(.title)
                    Text(book?.author ?? "")
                        .font(.title2)
                }
                .padding(.bottom)
                
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        StarView(isFilled: index <= book?.rating ?? 0)
                    }
                    Text("(\(book?.rating ?? 0))")
                }
                
                VStack (alignment: .leading) {
                    Text("Ismertető:")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .padding(.bottom)
                    Text(book?.bookDescription ?? "")
                }
                .padding()
                
                if let ratingBody = book?.ratingBody {
                    VStack (alignment: .leading) {
                        Text("Értékelés:")
                            .fontWeight(.semibold)
                            .font(.title3)
                            .padding(.bottom)
                        Text(ratingBody)
                    }
                }
            }
        }
        .frame(width: 320,height: 500)
        .background(colorScheme == .dark ? Color.primaryGrey : Color.white)
        .overlay( Button {
            isShowingDetail = false
        } label: {
            DismissButton()
        }, alignment: .topTrailing)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
        
}

struct StarView: View {
    let isFilled: Bool
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(isFilled ? .yellow : .gray)
    }
}

#Preview {
    BookDetailView(isShowingDetail: .constant(true), book: Book(author: "Sumb", title: "Sum book", price: 1200, purchaseDate: Date(), bookDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec scelerisque feugiat arcu, eu vehicula velit hendrerit quis. Duis justo nibh, laoreet id massa quis, sagittis commodo odio. Nulla et nisl eu nisi ornare ultricies. Sed at tempor nunc. Proin sed arcu accumsan, tempor odio at, vulputate nibh. Vivamus ultrices porttitor eros id faucibus. Nunc sit amet sem sit amet justo condimentum aliquet. Nulla sit amet velit sodales, dignissim sapien nec, dictum augue. Praesent hendrerit accumsan mollis. Duis aliquet finibus finibus. Fusce sit amet finibus massa, a convallis augue. Sed a lorem urna. Nam nisl ante, fringilla fringilla elementum a, bibendum non ligula. Mauris dignissim neque vitae erat efficitur varius. Praesent ullamcorper leo quam, eu laoreet sem fringilla sit amet.", rating: 5, ratingBody: "Shii idk", isWishlisted: true, isRead: false))
}
