//
//  Movie.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 19.12.2022.
//

import Foundation


struct Movie: Decodable {
    
  
    let results: [MovieResults]?
    
    }


struct MovieResults: Decodable {
    
    let id: Int?
    let posterPath: String?
    let overview, releaseDate, title: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case posterPath = "poster_path"
        case overview, title
        case   releaseDate = "release_date"
    }
    
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ??  ""
    }
    
    
    var _title: String {
        title ?? "N/A"
    }
    
    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
    
    var _overwiew: String {
        
        overview ?? "There is no overwiew!"
    }
    
}
