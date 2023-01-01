//
//  APIURLs.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 19.12.2022.
//

import Foundation


enum APIURLs  {
    
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=90382436ad33ed22739c4cc5fe8fb572&language=en-US&page=\(page)"
        
       
    }
    
    static func imageUrl(posterPath: String) -> String {
          
         "https://image.tmdb.org/t/p/w500\(posterPath)" 
    }
    
    static func details(id: Int) -> String {
        
        "https://api.themoviedb.org/3/movie/\(id)?api_key=90382436ad33ed22739c4cc5fe8fb572&language=en-US"
    }
}



