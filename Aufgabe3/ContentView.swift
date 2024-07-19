//
//  ContentView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import SwiftUI

@Observable
class Watchlist {
    var entries: Array<SearchEntry> = []
    
    func add(_ entry: SearchEntry) {
        entries.append(entry)
    }
    
    func remove(_ entry: SearchEntry) {
        var removingCount = 0
        for savedEntry in entries {
            if entry == savedEntry{
                break
            }
            removingCount += 1
        }
        entries.remove(at: removingCount)
    }
    
    func contains(_ entry: SearchEntry) -> Bool {
        entries.contains(entry)
    }
}


struct ContentView: View {
    
    @State var selection: Int = 1
    @State var watchlist: Watchlist = .init()
 
    var body: some View {
        ZStack {
            DiscoverView()
                .opacity(selection == 1 ? 1.0 : 0.0)
                .transaction(value: selection) { transaction in
                    if selection == 1 {
                        transaction.animation = .smooth
                    }else {
                        transaction.animation = nil
                    }
                }
            
            WatchlistView()
                .opacity(selection == 2 ? 1.0 : 0.0)
                .transaction(value: selection) { transaction in
                    if selection == 2 {
                        transaction.animation = .smooth
                    }else {
                        transaction.animation = nil
                    }
                }
        }
        .overlay(alignment: .top) {
            NavigationButton(selection: $selection)
                .padding(5)
        }
        .environment(watchlist)
    }
}

#Preview {
    ContentView()
}
