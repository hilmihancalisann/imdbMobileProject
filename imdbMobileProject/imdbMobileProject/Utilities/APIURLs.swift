//
//  APIURLs.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 19.12.2022.
//

import Foundation


enum APIURLs  {
    
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key="yourapikey"=\(page)"
        
       
    }
    
    static func imageUrl(posterPath: String) -> String {
          
         "https://image.tmdb.org/t/p/w500\(posterPath)" 
    }
    
    static func details(id: Int) -> String {
        
        "https://api.themoviedb.org/3/movie/\(id)?api_key="yourapikey"&language=en-US"
    }
}



