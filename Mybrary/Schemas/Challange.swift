//
//  Challange.swift
//  Mybrary
//
//  Created by Anda Levente on 24/06/2024.
//

import Foundation
import SwiftData

@Model
class Challange {
    var challange: String
    var isCompleted: Bool
    var completedDate: String?
    
    init(challange: String, isCompleted: Bool, completedDate: String? = nil) {
        self.challange = challange
        self.isCompleted = isCompleted
        self.completedDate = completedDate
    }
}
