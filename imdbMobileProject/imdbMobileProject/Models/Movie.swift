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
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case posterPath = "poster_path"
    }
}
