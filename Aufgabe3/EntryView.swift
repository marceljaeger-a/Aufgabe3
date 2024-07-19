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
    
    @State var showControl: Bool = false
    
    var body: some View {
        HStack(spacing: 25) {
            EntryPosterImage(posterURL: entry.poster)
                .onTapGesture {
                    showControl.toggle()
                }
            
            EntryInfoView(title: entry.title, year: entry.year, type: entry.type)
            
            Spacer()
        }
        .overlay(alignment: .leading) {
            BookmarkButton(entry: entry)
                .offset(x: -75)
        }
        .padding()
        .offset(x: showControl ? 100 : 0)
        .animation(.smooth, value: showControl)
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
    EntryView(entry: .init()).environment(Watchlist.init())
})
