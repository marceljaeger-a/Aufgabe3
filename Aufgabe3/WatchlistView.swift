//
//  WatchlistView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI

struct WatchlistView: View {
    @Environment(Watchlist.self) var watchlist
    
    var body: some View {
        EntriyScrollView(entries: watchlist.entries)
    }
}
