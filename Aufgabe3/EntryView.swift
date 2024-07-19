//
//  EntryView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI
import SwiftData

struct EntryView: View {
    let entry: SearchEntry
    
    @Query var bookmarkdEntries: Array<PersistentEntry>
    
    var persistentEntry: PersistentEntry? {
        for bookmarkdEntry in bookmarkdEntries {
            if bookmarkdEntry.imdbID == entry.imdbID {
                return bookmarkdEntry
            }
        }
        return nil
    }
    
    @Binding var selectedEntry: SearchEntry? 
    
    var isSelected: Bool {
        selectedEntry == entry
    }
    
    var body: some View {
        HStack(spacing: 25) {
            EntryPosterImage(posterURL: entry.poster)
                .overlay {
                    if let persistentEntry, persistentEntry.hasWatched {
                        ZStack {
                            Color.clear
                            
                            Image(systemName: "checkmark")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .bold()
                        }
                        .background(.ultraThinMaterial.opacity(0.6).blendMode(.darken), in: .rect(cornerRadius: 25))
                    }
                }
                .animation(.bouncy, value: persistentEntry?.hasWatched)
                
            EntryInfoView(title: entry.title, year: entry.year, type: entry.type)
            
            Spacer()
        }
        .onTapGesture {
            if isSelected {
                selectedEntry = nil
            }else {
                selectedEntry = entry
            }
        }
        .overlay(alignment: .leading) {
            VStack {
                if let persistentEntry {
                    WatchButton(persistendEntry: persistentEntry)
                        .offset(x: -75)
                }
                
                BookmarkButton(entry: entry)
                    .offset(x: -75)
            }
        }
        .padding()
        .offset(x: isSelected ? 100 : 0)
        .animation(.smooth, value: isSelected)
        .animation(.smooth, value: persistentEntry)
    }
}

struct EntryPosterImage: View {
    let posterURL: String
    
    var body: some View {
        AsyncImage(url: .init(string: posterURL), content: { image in
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
    }
}

struct EntryInfoView: View {
    let title: String
    let year: String
    let type: String
    
    @State var detailedEntry: DetailEntry?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.headline)
            
            HStack {
                Text(year)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .padding(2)
                    .background(Color.accentColor.opacity(0.5), in: .buttonBorder)
                
                Text(type.uppercased())
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .padding(2)
                    .background(Color.accentColor.opacity(0.5), in: .buttonBorder)
            }
        }
    }
}

#Preview(body: {
    EntryView(entry: .init(), selectedEntry: .constant(nil))
})
