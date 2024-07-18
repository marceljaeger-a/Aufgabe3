//
//  ContentView.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var entries: Array<DetailEntry> = []
    
    var body: some View {
        VStack {
            Text("\(entries.count)")
            
            Button {
                Task {
                    let service = OMDService()
                    do {
                        let result = try await service.getDetail(with: .title("Spiderman"))
                        print(result)
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Load")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
