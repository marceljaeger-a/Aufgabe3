//
//  PersistentEntry.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftData

@Model
class PersistentEntry {
    var isBookmard: Bool
    var hasWatched: Bool
    var title: String
    var year: String
    var type: String
    var poster: String
    var imdbID: String
    
    init(isBookmard: Bool, hasWatched: Bool, entry: SearchEntry) {
        self.isBookmard = isBookmard
        self.hasWatched = hasWatched
        self.title = entry.title
        self.year = entry.year
        self.type = entry.type
        self.poster = entry.poster
        self.imdbID = entry.imdbID
    }
}
