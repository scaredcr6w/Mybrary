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
//            Text("Teljesítve")
//                .fontWeight(.semibold)
            ScrollView{
                LazyVStack(spacing: 16){
                    Spacer()
                    ForEach(viewModel.challangesArray){ challange in
                        ChallangeCardView(isCompleted: challange.isCompleted,
                                          challange: challange.challange,
                                          completedDate: challange.completedDate)
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
