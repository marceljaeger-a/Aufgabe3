//
//  BookmarkButton.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI

struct BookmarkButton: View {
    let entry: SearchEntry
    let watchlist: Watchlist
    let isBookmarkd: Bool
    
    var body: some View {
        Image(systemName: "bookmark")
            .symbolVariant(isBookmarkd ? .fill : .none)
            .symbolEffect(.bounce, value: isBookmarkd)
            .padding()
            .foregroundStyle(.regularMaterial)
            .background(Color.orange, in: .circle)
            .onTapGesture {
                if isBookmarkd {
                    watchlist.remove(entry)
                }else {
                    watchlist.add(entry)
                }
            }
    }
}
