//
//  OMDError.swift
//  Aufgabe3
//
//  Created by Marcel Jäger on 18.07.24.
//

import Foundation


enum OMDError: Error {
    case invalidURLComponents
    case invalidURL
    case invalidResponse
    case noHTTPResponse
    case invalidStatusCode
    case invalidData
    case noArgument
}
