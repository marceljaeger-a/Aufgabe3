//
//  EntryView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI

struct EntryView: View {
    let entry: SearchEntry
    
    @Environment(Watchlist.self) var watchlist
    
    @State var showControl: Bool = false
    
    var isBookmarkd: Bool {
        watchlist.contains(entry)
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: .init(string: entry.poster), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(.rect(cornerRadius: 25))
                    .shadow(radius: 2)
            }, placeholder: {
                Color.secondary
                    .overlay {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                    .frame(width: 100, height: 200)
                    .clipShape(.rect(cornerRadius: 25))
                    .shadow(radius: 2)
            })
            .onTapGesture {
                showControl.toggle()
            }
            
            
            VStack(alignment: .leading) {
                Text(entry.title)
                    .font(.headline)
                
                Text(entry.year)
                    .font(.caption)
            }
            
            Spacer()
        }
        .overlay(alignment: .leading) {
            BookmarkButton(entry: entry, watchlist: watchlist, isBookmarkd: isBookmarkd)
                .offset(x: -75)
        }
        .padding()
        .offset(x: showControl ? 100 : 0)
        .animation(.smooth, value: showControl)
    }
}
