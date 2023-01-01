//
//  MovieService.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 19.12.2022.
//

import Foundation


final class MovieService {
    
    func downloadMovies(page: Int, completion: @escaping ([MovieResults]?) -> ()) {
        
        guard let url = URL(string: APIURLs.movies(page: page))
        else {return  }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self
            else { return }
            
            switch result {
            case.success(let data):
                print("success")
                completion(self.handleWithData(data))
            case.failure(let error):
                print("failure")
                self.handleWithError(error)
            }
        }
    }
    
    
    func dowloadDetails(id: Int, completion: @escaping (MovieResults?) -> ()) {
        
        guard let url = URL(string: APIURLs.details(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let data):
                completion(self.handleWithError(data))
            case.failure(let error):
                self.handleWithError(error)
            }
            
        }
    }
    
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResults]? {
        
        do {
            
            let movie = try JSONDecoder().decode(Movie.self, from: data)
           

            return movie.results
        }catch {
            print(error)
            
            return nil
            
        }
    }
    
    private func handleWithError(_ data:Data) -> MovieResults? {
        
        do {
            let movieDetail = try JSONDecoder().decode(MovieResults.self, from: data)
            return movieDetail
        }catch {
            print(error)
            return nil
        }
    }
}
