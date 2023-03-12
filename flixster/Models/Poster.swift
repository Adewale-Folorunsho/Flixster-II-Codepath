//
//  Poster.swift
//  flixster
//
//  Created by wale on 3/12/23.
//

import UIKit

struct PosterSearchResponse: Decodable {
    let page: Int
    let results: [Poster]
    let total_results: Int
    let total_pages: Int
}

struct Poster: Decodable {
    let poster_path: String
}
