//
//  WatchlistView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI
import SwiftData

struct WatchlistView: View {
    @Binding var selectedEntry: SearchEntry?
    @Query var entries: Array<PersistentEntry>
    
    var body: some View {
        EntriyScrollView(entries: entries.map { SearchEntry(title: $0.title, year: $0.year, type: $0.type, poster: $0.poster, imdbID: $0.imdbID)}, selectedEntry: $selectedEntry)
    }
}
