//
//  ChallangesView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import SwiftUI
import SwiftData

struct ChallangesView: View {
    @ObservedObject var viewModel = ChallangesViewModel()
    @Environment(\.modelContext) private var context
    @Query var challangesData: [Challange] = []
    
    var completedChallanges: Int {
        challangesData.filter { $0.isCompleted }.count
    }
    
    var challangesCount: Int {
        challangesData.count
    }
    
    var completedChallangesPercentage: Double {
        Double(completedChallanges) / Double(challangesCount)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    Spacer()
                    VStack {
                        Text("Teljesített kihívások: ")
                            .font(.title2)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    HStack {
                        ProgressView(value: completedChallangesPercentage)
                        Text("\(completedChallanges) / \(challangesCount)")
                    }
                    .padding(.horizontal, 25)
                    ForEach(challangesData) { challange in
                        ChallangeCardView(isCompleted: challange.isCompleted,
                                          challange: challange.challange,
                                          completedDate: challange.completedDate ?? "")
                        .onTapGesture(count: 2, perform: {
                            if !challange.isCompleted{
                                challange.isCompleted = true
                                challange.completedDate = dateFormat()
                            } else {
                                challange.isCompleted = false
                            }
                            
                        })
                    }
                }
            }
            .navigationTitle("Kihívások")
            .onAppear {
                if challangesData.isEmpty {
                    viewModel.challenges.forEach { challange in
                        context.insert(challange)
                    }
                }
            }
        }
    }
    
    
    func dateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy.MM.dd"
        return dateFormatter.string(from: Date())
    }
}

