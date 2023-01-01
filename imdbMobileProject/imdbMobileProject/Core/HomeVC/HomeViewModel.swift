//
//  HomeViewModel.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 19.12.2022.
//

import Foundation


protocol HomeViewModelInterface {
    
    var view: HomeScreenInterface? {get set}
    
    func viewDidload()
    func getMovies()
}



final class HomeViewModel {
    
    weak var view : HomeScreenInterface?
    private let service = MovieService()
    var movies: [MovieResults] = []
}

extension HomeViewModel: HomeViewModelInterface {
    
  
    func viewDidload() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
        
    }
    
    func getMovies() {
        service.downloadMovies { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
            self.movies = returnedMovies
          
           
            
            
        }
    }
}
