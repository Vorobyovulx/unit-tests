//
//  URLRequest+Extensions.swift
//  MadUnitExample
//
//  Created by Mad Brains on 11.06.2021.
//

import Foundation

extension URLRequest {

    static func search(term: String) -> URLRequest {
        var components = URLComponents(string: "https://itunes.apple.com/search")
        
        components?.queryItems = [
            .init(name: "media", value: "music"),
            .init(name: "entity", value: "song"),
            .init(name: "term", value: "\(term)")
        ]

        return URLRequest(url: components!.url!)
    }
    
}
