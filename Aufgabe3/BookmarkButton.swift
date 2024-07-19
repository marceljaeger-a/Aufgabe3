//
//  BookmarkButton.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI
import SwiftData

struct BookmarkButton: View {
    let entry: SearchEntry
    @Environment(\.modelContext) var modelContext
    @Query var bookmardEntries: Array<PersistentEntry>
    var  isBookmarkd: Bool {
        bookmardEntries.contains { $0.imdbID == entry.imdbID }
    }
    
    var body: some View {
        Image(systemName: "bookmark")
            .symbolVariant(isBookmarkd ? .fill : .none)
            .symbolEffect(.bounce, value: isBookmarkd)
            .padding()
            .foregroundStyle(.regularMaterial)
            .background(Color.orange, in: .circle)
            .onTapGesture {
                if isBookmarkd {
                    let deletingEntry = entry
                    do {
                        try modelContext.delete(model: PersistentEntry.self, where: #Predicate { $0.imdbID ==  deletingEntry.imdbID })
                    } catch {
                        print(error)
                    }
                }else {
                    modelContext.insert(PersistentEntry(isBookmard: true, hasWatched: false, entry: entry))
                }
            }
    }
}
