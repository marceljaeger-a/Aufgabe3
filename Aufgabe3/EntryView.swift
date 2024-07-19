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
    @Binding var watchlist: Array<SearchEntry>
    
    @State var showControl: Bool = false
    
    @State var isBookmarkd = false
    
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
            Image(systemName: "bookmark")
                .symbolVariant(isBookmarkd ? .fill : .none)
                .symbolEffect(.bounce, value: isBookmarkd)
                .padding()
                .foregroundStyle(.regularMaterial)
                .background(Color.orange, in: .circle)
                .onTapGesture {
                    if isBookmarkd {
                        var removingCount = 0
                        for watchEntry in watchlist {
                            if watchEntry == entry {
                                break
                            }
                            removingCount += 1
                        }
                        watchlist.remove(at: removingCount)
                    }else {
                        watchlist.append(entry)
                    }
                }
                .offset(x: -75)
        }
        .padding()
        .offset(x: showControl ? 100 : 0)
        .animation(.smooth, value: showControl)
        .onAppear {
            if watchlist.contains(entry) {
                isBookmarkd = true
            }else {
                isBookmarkd = false
            }
        }
        .onChange(of: watchlist) { newValue in
            if watchlist.contains(entry) {
                isBookmarkd = true
            }else {
                isBookmarkd = false
            }
        }
    }
}
