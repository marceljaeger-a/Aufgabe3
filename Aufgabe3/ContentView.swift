//
//  ContentView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import SwiftUI



struct ContentView: View {
    
    @State var selection: Int = 1
    @State var watchlist: Array<SearchEntry> = []
 
    var body: some View {
        ZStack {
            DiscoverView(watchlist: $watchlist)
                .opacity(selection == 1 ? 1.0 : 0.0)
                .transaction(value: selection) { transaction in
                    if selection == 1 {
                        transaction.animation = .smooth
                    }else {
                        transaction.animation = nil
                    }
                }
            
            WatchlistView(watchlist: $watchlist)
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
    }
}

#Preview {
    ContentView()
}
