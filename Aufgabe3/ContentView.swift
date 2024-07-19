//
//  ContentView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import SwiftUI

//@Observable
//class Watchlist {
//    var entries: Array<SearchEntry> = []
//    
//    func add(_ entry: SearchEntry) {
//        entries.append(entry)
//    }
//    
//    func remove(_ entry: SearchEntry) {
//        var removingCount = 0
//        for savedEntry in entries {
//            if entry == savedEntry{
//                break
//            }
//            removingCount += 1
//        }
//        entries.remove(at: removingCount)
//    }
//    
//    func contains(_ entry: SearchEntry) -> Bool {
//        entries.contains(entry)
//    }
//}


struct ContentView: View {
    
    @State var navigation : Int = 1
    
    @State var selectedEntry: SearchEntry? = nil
 
    var body: some View {
        ZStack {
            DiscoverView(selectedEntry: $selectedEntry)
                .opacity(navigation == 1 ? 1.0 : 0.0)
                .transaction(value: navigation) { transaction in
                    if navigation == 1 {
                        transaction.animation = .smooth
                    }else {
                        transaction.animation = nil
                    }
                }
            
            WatchlistView(selectedEntry: $selectedEntry)
                .opacity(navigation == 2 ? 1.0 : 0.0)
                .transaction(value: navigation) { transaction in
                    if navigation == 2 {
                        transaction.animation = .smooth
                    }else {
                        transaction.animation = nil
                    }
                }
        }
        .overlay(alignment: .top) {
            NavigationButton(selection: $navigation, selectedEntry: $selectedEntry)
                .padding(5)
        }
    }
}

#Preview {
    ContentView()
}
