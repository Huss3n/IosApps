//
//  Characters.swift
//  RickAndMorty
//
//  Created by Muktar Hussein on 02/11/2023.
//

import Foundation

import Foundation

struct Characters: Identifiable, Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String?
    var gender: String
    var origin: Location
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: Date

    struct Location: Codable {
        var name: String
        var url: String
    }
}


