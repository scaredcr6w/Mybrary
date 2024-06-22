//
//  MybraryApp.swift
//  Mybrary
//
//  Created by Anda Levente on 18/05/2024.
//

import SwiftUI
import SwiftData

@main
struct MybraryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Book.self])
    }
}
