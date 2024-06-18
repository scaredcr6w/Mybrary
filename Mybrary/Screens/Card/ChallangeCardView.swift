//
//  ChallangeCardView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import SwiftUI

struct ChallangeCardView: View {
    
    @State var isCompleted: Bool
    let challange: String
    var completedDate: String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 50, maxHeight: 50)
                .foregroundStyle(isCompleted ? .green : .clear)
                .padding()
            VStack(alignment: .leading){
                Text(challange)
                    .bold()
                    .font(.system(size: 18))
                
                if isCompleted{
                    Text(completedDate)
                }
            }
            .padding(.trailing)
        }
        .frame(width: 340, height: 120, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

#Preview {
    ChallangeCardView(isCompleted: true, challange: "Olvass el egy könyvet", completedDate: "2024.06.18")
}
