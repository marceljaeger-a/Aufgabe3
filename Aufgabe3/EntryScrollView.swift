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
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(entries, id: \.self) { entry in
                    EntryView(entry: entry)
                }
            }
        }
        .contentMargins(.vertical, 50)
    }
}

