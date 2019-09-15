//
//  UpcomingMovies.swift
//  Upcoming Movies
//
//  Created by Mac-Mini on 29/10/18.
//  Copyright © 2018 Mac-Mini. All rights reserved.
//

import Foundation

struct UpcomingMovies : Codable {
    
    //MARK: Properties
    let results: [Movie]?
    let page, totalResults: Int?
    let dates: Dates?
    let totalPages: Int?
    
//    init(results: [Movie]?, page: Int?, totalResults: Int?, totalPages: Int?) {
//        self.results = results
//        self.page = page
//        self.totalResults = totalResults
//        //self.dates = dates
//        self.totalPages = totalPages
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(results, forKey: .results)
//        try container.encode(page, forKey: .page)
//        try container.encode(totalResults, forKey: .totalResults)
//        try container.encode(totalPages, forKey: .totalPages)
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        try values.decode(Movie.self, forKey: .results)
//        try values.decode(Int.self, forKey: .page)
//        try values.decode(Int.self, forKey: .totalResults)
//        //try values.decode(Dates.self, forKey: .dates)
//        try values.decode(Int.self, forKey: .totalPages)
//    }
    
    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case dates
        case totalPages = "total_pages"
    }
    
    struct Dates: Codable {
        let maximum, minimum: String
    }
}

