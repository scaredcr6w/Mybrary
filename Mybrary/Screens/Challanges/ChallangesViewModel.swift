//
//  ChallangesViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 18/06/2024.
//

import Foundation

struct Challanges : Identifiable{
    let id = UUID()
    var isCompleted: Bool
    let challange: String
    var completedDate: String
}

class ChallangesViewModel : ObservableObject{
    @Published var challangesArray: [Challanges] = [
        .init(isCompleted: false, challange: "Olvass el egy könyvet", completedDate: ""),
        .init(isCompleted: true, challange: "Költs 10.000 forintot fekete könyvekre", completedDate: "2020.12.01")
    ]
    
    func challangeUpdated(withId id: UUID){
        if let index = challangesArray.firstIndex(where: { $0.id == id}){
            var updatedChallange = challangesArray[index]
            
            updatedChallange.isCompleted.toggle()
            
            if updatedChallange.isCompleted{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy.MM.dd"
                let today = dateFormatter.string(from: Date())
                
                updatedChallange.completedDate = today
            } else {
                updatedChallange.completedDate = ""
            }
            challangesArray[index] = updatedChallange
        }
    }
}
