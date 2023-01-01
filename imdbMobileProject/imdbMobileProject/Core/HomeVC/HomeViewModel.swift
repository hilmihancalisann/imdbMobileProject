//
//  HomeViewModel.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 19.12.2022.
//

import Foundation
import Metal


protocol HomeViewModelInterface {
    
    var view: HomeScreenInterface? {get set}
    
    func viewDidload()
    func getMovies()
}



final class HomeViewModel {
    
    weak var view : HomeScreenInterface?
    private let service = MovieService()
    var movies: [MovieResults] = []
    private var page: Int = 1
    
}

extension HomeViewModel: HomeViewModelInterface {
    
  
    func viewDidload() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
        
    }
    
    func getMovies() {
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
            self.movies.append(contentsOf: returnedMovies)
          
            self.page += 1
            self.view?.reoladedCollectionView()
            
        }
    }
    
    func getDetail(id: Int) {
        service.dowloadDetails(id: id) { [weak self] returnDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnDetail else { return }
            
            self.view?.navigateDetailScree(movie: returnedDetail)
            
        }
    }
}
