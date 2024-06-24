//
//  ChallangesView.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import SwiftUI

struct ChallangesView: View {
    @ObservedObject var viewModel = ChallangesViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 16){
                    Spacer()
                    ForEach(viewModel.challangesArray){ challange in
                        ChallangeCardView(isCompleted: challange.isCompleted,
                                          challange: challange.challange,
                                          completedDate: challange.completedDate)
                        .onTapGesture(count: 2, perform: {
                            if !challange.isCompleted{
                                viewModel.challangeUpdated(withId: challange.id)
                            }
                            
                        })
                    }
                }
            }
            .navigationTitle("Kihívások")
        }
    }
}

#Preview {
    ChallangesView()
}
