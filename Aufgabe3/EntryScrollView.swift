//
//  EntryScrollView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI

struct EntriyScrollView: View {
    let entries: Array<SearchEntry>
    @Binding var watchlist: Array<SearchEntry>
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(entries, id: \.self) { entry in
                    EntryView(entry: entry, watchlist: $watchlist)
                }
            }
        }
        .contentMargins(.vertical, 50)
    }
}

