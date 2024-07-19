//
//  SearchButton.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI

struct EntrySearchButton: View {
    @Binding var entries: Array<SearchEntry>
    
    @State var isSearching: Bool = false
    @State var isButtonExpanded: Bool = false
    @State var searchText: String = ""
    
    var backgroundShape: AnyShape {
        if isButtonExpanded{
            return AnyShape(.capsule)
        }else {
            return AnyShape(.circle)
        }
    }
    
    var backgroundColor: AnyShapeStyle {
        if isButtonExpanded {
            return AnyShapeStyle(.regularMaterial)
        }else {
            return AnyShapeStyle(Color.accentColor)
        }
    }
    
    var buttonColor: AnyShapeStyle {
        if isButtonExpanded {
            return AnyShapeStyle(Color.accentColor)
        }else {
            return AnyShapeStyle(.regularMaterial)
        }
    }
    
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        HStack {
            ZStack {
                if isButtonExpanded {
                    TextField("Search...", text: $searchText)
//                        .focused($isTextFieldFocused)
                        .onSubmit {
                            Task {
                                let service = OMDService()
                                do {
                                    entries = try await service.search(title: searchText).search
                                } catch {
                                    print(error)
                                }
                            }
                        }
                }
            }
            .transaction(value: isButtonExpanded) { transaction in
                if isButtonExpanded {
                    transaction.animation = .smooth.delay(0.3)
                    transaction.addAnimationCompletion {
                        if isButtonExpanded {
                            isTextFieldFocused = true
                        }else {
                            isTextFieldFocused = false
                        }
                    }
                }else {
                    transaction.animation = nil
                }
                
            }
            
            Button {
                isButtonExpanded.toggle()
            } label: {
                Image(systemName: "sparkle.magnifyingglass")
                    .foregroundStyle(buttonColor)
                    .font(.title3)
            }
        }
        .padding()
        .background(backgroundColor.shadow(.drop(radius: 2)), in: backgroundShape)
        .transaction(value: isButtonExpanded, { transaction in
            transaction.animation = .bouncy
        })
    }
}
