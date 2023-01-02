//
//  DetailScreenVM.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 1.01.2023.
//

import Foundation

protocol DetailScreenVMInterFace {
    
    var view: DetailScrenInterFace? {get set}
    
    func viewDidload()
}


final class DetailScrenVM {
    weak var view: DetailScrenInterFace?

}




extension DetailScrenVM: DetailScreenVMInterFace {
    
    
    func viewDidload() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.dowloadPosterImage()
        view?.configureDTitleLabel()
        view?.configureDateLabel()
        view?.configureOverwievLabel()
    }
    
  
}
    
    

