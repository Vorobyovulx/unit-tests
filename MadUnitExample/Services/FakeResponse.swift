//
//  Response.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import Foundation

struct SearchMediaResponse: Codable {

    let results: [Track]

}

struct Track: Codable, Equatable {

    let trackName: String?
    let artistName: String?
    
}
