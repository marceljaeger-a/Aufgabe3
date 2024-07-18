//
//  SearchEntry.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import Foundation


struct SearchEntry: Codable {
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var poster: String
    
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .Title)
        self.year = try container.decode(String.self, forKey: .Year)
        self.imdbID = try container.decode(String.self, forKey: .imdbID)
        self.type = try container.decode(String.self, forKey: .Type)
        self.poster = try container.decode(String.self, forKey: .Poster)
    }
    
    enum CodingKeys: CodingKey {
        case Title
        case Year
        case imdbID
        case `Type`
        case Poster
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .Title)
        try container.encode(self.year, forKey: .Year)
        try container.encode(self.imdbID, forKey: .imdbID)
        try container.encode(self.type, forKey: .Type)
        try container.encode(self.poster, forKey: .Poster)
    }
}
