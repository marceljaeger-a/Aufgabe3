//
//  NavigationButton.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 19.07.24.
//

import Foundation
import SwiftUI

struct NavigationButton: View {
    @Binding var selection: Int
    @Binding var selectedEntry: SearchEntry?
    
    var colorOfFirstButton: AnyShapeStyle {
        if selection == 1 {
            AnyShapeStyle(Color.accentColor)
        }else {
            AnyShapeStyle(.secondary)
        }
    }
    
    var colorOfSecondButton: AnyShapeStyle {
        if selection == 2 {
            AnyShapeStyle(Color.accentColor)
        }else {
            AnyShapeStyle(.secondary)
        }
    }
    
    var body: some View {
        HStack {
            Button {
                selectedEntry = nil
                selection = 1
            } label: {
                Image(systemName: "film.stack")
                    .padding()
                    .foregroundStyle(colorOfFirstButton)
            }
            .controlSize(.small)
            
            Button {
                selectedEntry = nil
                selection = 2
            } label: {
                Image(systemName: "bookmark.fill")
                    .padding()
                    .foregroundStyle(colorOfSecondButton)
            }
            .controlSize(.small)
        }
        .background(alignment: selection == 1 ? .leading : .trailing) {
            Circle()
                .fill(Color.accentColor.tertiary.shadow(.inner(radius: 1)))
        }
        .padding(3)
        .background(.regularMaterial.shadow(.drop(radius: 2)), in: .capsule)
        .animation(.snappy, value: selection)
    }
}
