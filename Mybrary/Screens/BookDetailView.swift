//
//  BookDetailView.swift
//  Mybrary
//
//  Created by Anda Levente on 27/06/2024.
//

import SwiftUI

struct BookDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    var author: String
    var title: String
    var price: Int
    var purchaseDate: Date
    var bookDescription: String
    var rating: Decimal
    var isWishlisted: Bool
    var isRead: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Image("placeholdercover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                VStack {
                    Text("\(title)")
                        .bold()
                        .font(.system(size: 28))
                    Text("\(author)")
                        .font(.system(size: 20))
                }
            }
            .frame(width: 320,height: 500)
            .background(colorScheme == .dark ? Color.primaryGrey : Color.white)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        //apply blur
    }
        
}

#Preview {
    BookDetailView(author: "Sumb", title: "Sum book", price: 1200, purchaseDate: Date(), bookDescription: "Lorem ipsum", rating: 5.0, isWishlisted: true, isRead: false)
}
