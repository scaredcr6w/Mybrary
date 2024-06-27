//
//  StatisticsView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import SwiftUI
import SwiftData
import Charts

struct StatisticsView: View {
    
    @Environment(\.modelContext) var context
    @Query(filter: #Predicate<Book>{ $0.isWishlisted }) var statisticsData: [Book]
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Olvasott könyvek: ")
                    .bold()
                    .font(.system(size: 24))
                Chart{
                    ForEach(statisticsData){ data in
//                        BarMark(x: .value("Hónap", data.purchaseDate), y: .value("Könyvek", data.booksRead))
                    }
                }
                .frame(height: 200)
            }
            .padding()
            .navigationTitle("Statisztika")
            
            Spacer()
        }
    }
}

#Preview {
    StatisticsView()
}
