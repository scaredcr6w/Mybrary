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
    let cover: String = "placeholdercover"
    
    var body: some View {
        HStack{
            Image(cover)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100, maxHeight: 100)
                
            VStack(alignment: .leading){
                Text(title)
                    .bold()
                    .font(.system(size: 18))
                Text(author)
                
            }
            .padding(.trailing)
        }
        .frame(width: 340, height: 120, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ListCardView(title: "Feljegyzések az egérlyukból", author: "Dosztojevszkij")
}
