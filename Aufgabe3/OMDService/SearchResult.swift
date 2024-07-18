//
//  OMDSearch.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import Foundation

struct SearchResult: Codable {
    var search: Array<SearchEntry>
    var totalResults: String
    var response: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.search = try container.decode([SearchEntry].self, forKey: .Search)
        self.totalResults = try container.decode(String.self, forKey: .totalResults)
        self.response = try container.decode(String.self, forKey: .Response)
    }
    
    enum CodingKeys: CodingKey {
        case Search
        case totalResults
        case Response
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.search, forKey: .Search)
        try container.encode(self.totalResults, forKey: .totalResults)
        try container.encode(self.response, forKey: .Response)
    }
}


