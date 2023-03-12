//
//  Track.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/2/22.
//

import Foundation

// TODO: Pt 1 - Create a Track model struct

struct Movie: Decodable{
    let original_title: String
    let overview: String
    let poster_path: String?
    let vote_average: Float
    let release_date: String
    let id: Int
}

struct Date: Decodable{
    let maximum: String
    let minimum: String
}

struct MovieSearchResponse: Decodable{
    let page: Int
    let results: [Movie]
}
//// MARK: Helper Methods
///// Converts milliseconds to mm:ss format
/////  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
