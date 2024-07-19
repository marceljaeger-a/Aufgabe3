//
//  WatchButton.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI
import SwiftData

struct WatchButton: View {
    let persistendEntry: PersistentEntry
    
    var isWatched: Bool {
        persistendEntry.hasWatched
    }
    
    var body: some View {
        Image(systemName: isWatched ? "popcorn.fill" : "popcorn")
            .symbolVariant(isWatched ? .fill : .none)
            .symbolEffect(.bounce, value: isWatched)
            .padding()
            .foregroundStyle(.regularMaterial)
            .background(Color.green, in: .circle)
            .onTapGesture {
                persistendEntry.hasWatched.toggle()
            }
    }
}
