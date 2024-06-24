//
//  HomepageView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI

struct HomepageView: View {
    var body: some View{
        NavigationStack{
            ScrollView(.vertical){
                VStack(spacing: 30){
                    HeaderScrollView()
                        Text("Újdonságok")
                            .bold()
                            .font(.system(size: 30))
                    Link(destination: URL(string: "https://www.libri.hu/sikerlista/?heti")!, label: {
                        WideCardView(cardTitle: "Libri Sikerlista", cardDescription: "Legforróbb könyvek 🥵", cardImage: "bookCardRead")
                    })
                    Link(destination: URL(string: "https://www.libri.hu/ujdonsagok/")!, label: {
                        WideCardView(cardTitle: "Új megjelenések", cardDescription: "Nagyon érdekes történetek?", cardImage: "bookCardRead")
                    })
                    Link(destination: URL(string: "https://www.libri.hu/elorendelheto/")!, label: {
                        WideCardView(cardTitle: "Előrendelhetők", cardDescription: "Etesd a kapitalizmus gyomrát!", cardImage: "bookCardRead")
                    })
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("Kezdőlap")
        }
        
    }
}

#Preview {
    HomepageView()
}
