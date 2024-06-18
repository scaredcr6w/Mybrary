//
//  StatisticsView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import SwiftUI
import Charts

struct StatisticsView: View {
    
    @ObservedObject var viewModel = StatisticsViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Olvasott könyvek: \(viewModel.booksArray.reduce(0) { $0 + $1.booksRead })")
                    .bold()
                    .font(.system(size: 24))
                Chart{
                    ForEach(viewModel.booksArray){ data in
                        BarMark(x: .value("Hónap", data.month), y: .value("Könyvek", data.booksRead))
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
