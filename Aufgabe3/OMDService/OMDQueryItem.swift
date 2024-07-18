//
//  OMDQueryItem.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import Foundation


protocol OMDQueryItem {
    var queryItem: URLQueryItem { get }
    init(name: String, value: String)
}

struct GetQueryItem: OMDQueryItem {
    let queryItem: URLQueryItem
    
    init(name: String, value: String) {
        self.queryItem = URLQueryItem(name: name, value: value)
    }
}

struct SearchQueryItem: OMDQueryItem {
    let queryItem: URLQueryItem
    
    init(name: String, value: String) {
        self.queryItem = URLQueryItem(name: name, value: value)
    }
}



enum Plot: String {
    case short = "short"
    case full = "full"
}

enum EntryType: String {
    case movie = "movie"
    case series = "series"
    case episode = "episode"
}



extension GetQueryItem {
    static func imdbID(_ value: String) -> Self {
        .init(name: "i", value: value)
    }
    
    static func title(_ value: String) -> Self {
        .init(name: "t", value: value)
    }
    
    static func type(_ value: EntryType) -> Self {
        .init(name: "type", value: value.rawValue)
    }
    
    static func year(_ value: String) -> Self {
        .init(name: "type", value: value)
    }
    
    static func plot(_ value: Plot = .short) -> Self {
        .init(name: "type", value: value.rawValue)
    }
}



extension SearchQueryItem {
    static func title(_ value: String) -> Self {
        .init(name: "s", value: value)
    }
    
    static func type(_ value: EntryType) -> Self {
        .init(name: "type", value: value.rawValue)
    }
    
    static func year(_ value: String) -> Self {
        .init(name: "type", value: value)
    }
    
    static func page(_ value: Int) -> Self {
        .init(name: "page", value: "\(value)")
    }
}
