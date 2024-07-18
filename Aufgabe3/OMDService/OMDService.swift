//
//  OMDService.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import Foundation

struct OMDService {
    func getDetail(with items: GetQueryItem...) async throws -> DetailEntry {
        guard items.isEmpty == false else {
            throw OMDError.noArgument
        }
        
        let urlComponents = URLComponents(string: "https://www.omdbapi.com/")

        guard var urlComponents else {
            throw OMDError.invalidURLComponents
        }
        
        let queryItems = [.init(name: "apikey", value: "8d2b3227")] + items.map { $0.queryItem }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw OMDError.invalidURL
        }

        guard let (data, response) = try? await URLSession.shared.data(from: url)else {
            throw OMDError.invalidResponse
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw OMDError.noHTTPResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw OMDError.invalidStatusCode
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(DetailEntry.self, from: data)
        } catch {
            throw OMDError.invalidData
        }
    }
    
    func search(title: String, with items: SearchQueryItem...) async throws -> SearchResult {
        guard items.isEmpty == false else {
            throw OMDError.noArgument
        }
        
        let urlComponents = URLComponents(string: "https://www.omdbapi.com/")

        guard var urlComponents else {
            throw OMDError.invalidURLComponents
        }
        
        let queryItems = [.init(name: "apikey", value: "8d2b3227"), SearchQueryItem.title(title).queryItem] + items.map { $0.queryItem }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw OMDError.invalidURL
        }

        guard let (data, response) = try? await URLSession.shared.data(from: url)else {
            throw OMDError.invalidResponse
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw OMDError.noHTTPResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw OMDError.invalidStatusCode
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(SearchResult.self, from: data)
        } catch {
            throw OMDError.invalidData
        }
    }
}


