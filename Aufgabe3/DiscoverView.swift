//
//  DiscoverView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI

struct DiscoverView: View {
    @Binding var watchlist: Array<SearchEntry>
    
    @State var entries: Array<SearchEntry> = []
    @State var searchText: String = ""
    
    var body: some View {
        EntriyScrollView(entries: entries, watchlist: $watchlist)
            .overlay(alignment: .bottomTrailing) {
                EntrySearchButton(entries: $entries)
                    .padding()
            }
    }
}
