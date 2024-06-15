//
//  ListCardView.swift
//  Mybrary
//
//  Created by Anda Levente on 15/06/2024.
//

import SwiftUI

struct ListCardView: View {
    let title: String
    let author: String
    let cover: String
    
    var body: some View {
        HStack{
            Image(cover)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 80)
                .padding(8)
                
            VStack(alignment: .leading){
                Text(title)
                    .bold()
                    .font(.system(size: 18))
                Text(author)
                
            }
            .padding()
        }
        .frame(height: 100)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

#Preview {
    ListCardView(title: "Feljegyzések az egérlyukból", author: "Dosztojevszkij", cover: "placeholdercover")
}
