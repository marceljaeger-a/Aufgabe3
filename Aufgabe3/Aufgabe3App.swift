//
//  Aufgabe3App.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import SwiftUI
import SwiftData

@main
struct Aufgabe3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: PersistentEntry.self, inMemory: false)
        }
    }
}
