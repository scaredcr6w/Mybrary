//
//  ListCardView.swift
//  Mybrary
//
//  Created by Anda Levente on 15/06/2024.
//

import SwiftUI

struct ListCardView: View {
    @Environment(\.colorScheme) var colorScheme
    let title: String
    let author: String
    let coverImage: Data?
    
    var body: some View {
        HStack {
            
            if let coverImage,
               let uiImage = UIImage(data: coverImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            } else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .foregroundStyle(Color.gray)
            }
            
            VStack (alignment: .leading) {
                Text(title)
                    .bold()
                    .font(.system(size: 18))
                Text(author)
                
            }
            .padding(.trailing)
        }
        .frame(width: 340, height: 120, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .contentShape(Rectangle())
    }
}

#Preview {
    ListCardView(title: "Feljegyzések az egérlyukból", author: "Dosztojevszkij", coverImage: nil)
}
