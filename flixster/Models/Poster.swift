//
//  Poster.swift
//  flixster
//
//  Created by wale on 3/12/23.
//

import UIKit

struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let artworkUrl100: URL
}
