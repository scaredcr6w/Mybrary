//
//  ChallangesViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 24/06/2024.
//

import Foundation

class ChallangesViewModel : ObservableObject {
    @Published var challanges: [Challange] = [
        .init(challange: "Vegyél egy könyvet", isCompleted: false, completedDate: nil),
        .init(challange: "Vegyél még egy könyvet", isCompleted: false, completedDate: nil)
    ]
}
