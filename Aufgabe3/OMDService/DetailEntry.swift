//
//  Entry.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import Foundation


struct DetailEntry: Codable {
    var title: String
    var year: String
    var rated: String
    var released: String
    var runtime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var awards: String
    var poster: String
    var ratings: Array<Rating>
    var metascore: String
    var imdbRating: String
    var imdbVotes: String
    var imdbID: String
    var type: String
    var dvd: String
    var boxOffice: String
    var production: String
    var website: String
    var totalSeasons: String
    var response: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .Title)
        self.year = try container.decode(String.self, forKey: .Year)
        self.rated = try container.decode(String.self, forKey: .Rated)
        self.released = try container.decode(String.self, forKey: .Released)
        self.runtime = try container.decode(String.self, forKey: .Runtime)
        self.genre = try container.decode(String.self, forKey: .Genre)
        self.director = try container.decode(String.self, forKey: .Director)
        self.writer = try container.decode(String.self, forKey: .Writer)
        self.actors = try container.decode(String.self, forKey: .Actors)
        self.plot = try container.decode(String.self, forKey: .Plot)
        self.language = try container.decode(String.self, forKey: .Language)
        self.country = try container.decode(String.self, forKey: .Country)
        self.awards = try container.decode(String.self, forKey: .Awards)
        self.poster = try container.decode(String.self, forKey: .Poster)
        self.ratings = try container.decode([Rating].self, forKey: .Ratings)
        self.metascore = try container.decode(String.self, forKey: .Metascore)
        self.imdbRating = try container.decode(String.self, forKey: .imdbRating)
        self.imdbVotes = try container.decode(String.self, forKey: .imdbVotes)
        self.imdbID = try container.decode(String.self, forKey: .imdbID)
        self.type = try container.decode(String.self, forKey: .Type)
        self.dvd = try container.decode(String.self, forKey: .DVD)
        self.boxOffice = try container.decode(String.self, forKey: .BoxOffice)
        self.production = try container.decode(String.self, forKey: .Production)
        self.website = try container.decode(String.self, forKey: .Website)
        self.totalSeasons = try container.decode(String.self, forKey: .totalSeasons)
        self.response = try container.decode(String.self, forKey: .Response)
    }
    
    enum CodingKeys: CodingKey {
        case Title
        case Year
        case Rated
        case Released
        case Runtime
        case Genre
        case Director
        case Writer
        case Actors
        case Plot
        case Language
        case Country
        case Awards
        case Poster
        case Ratings
        case Metascore
        case imdbRating
        case imdbVotes
        case imdbID
        case `Type`
        case DVD
        case BoxOffice
        case Production
        case Website
        case totalSeasons
        case Response
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .Title)
        try container.encode(self.year, forKey: .Year)
        try container.encode(self.rated, forKey: .Rated)
        try container.encode(self.released, forKey: .Released)
        try container.encode(self.runtime, forKey: .Runtime)
        try container.encode(self.genre, forKey: .Genre)
        try container.encode(self.director, forKey: .Director)
        try container.encode(self.writer, forKey: .Writer)
        try container.encode(self.actors, forKey: .Actors)
        try container.encode(self.plot, forKey: .Plot)
        try container.encode(self.language, forKey: .Language)
        try container.encode(self.country, forKey: .Country)
        try container.encode(self.awards, forKey: .Awards)
        try container.encode(self.poster, forKey: .Poster)
        try container.encode(self.ratings, forKey: .Ratings)
        try container.encode(self.metascore, forKey: .Metascore)
        try container.encode(self.imdbRating, forKey: .imdbRating)
        try container.encode(self.imdbVotes, forKey: .imdbVotes)
        try container.encode(self.imdbID, forKey: .imdbID)
        try container.encode(self.type, forKey: .Type)
        try container.encode(self.dvd, forKey: .DVD)
        try container.encode(self.boxOffice, forKey: .BoxOffice)
        try container.encode(self.production, forKey: .Production)
        try container.encode(self.website, forKey: .Website)
        try container.encode(self.totalSeasons, forKey: .totalSeasons)
        try container.encode(self.response, forKey: .Response)
    }
}
