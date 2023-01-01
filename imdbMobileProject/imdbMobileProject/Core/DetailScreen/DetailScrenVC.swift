//
//  DetailScrenVC.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 1.01.2023.
//

import UIKit

protocol DetailScrenInterFace: AnyObject {
    
    func configureVC()
    func configurePosterImageView()
    func dowloadPosterImage()
    
}



class DetailScrenVC: UIViewController {

    
    private let movie: MovieResults
    
    private let viewModel = DetailScrenVM()
    
    private let padding: CGFloat = 16
    private var posterImageView: PosterImageView!
    
    init(movie: MovieResults) {
        
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        viewModel.view = self
        viewModel.viewDidload()
        
    }
    
    

}

extension DetailScrenVC: DetailScrenInterFace {
    func dowloadPosterImage() {
        posterImageView.dowloadImage(movie: movie)
    }
    
    func configurePosterImageView() {
        
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
       
        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
        
        let posterWidth = CGFloat.dWidth * 0.4
        
        NSLayoutConstraint.activate([
        
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            posterImageView.widthAnchor.constraint(equalToConstant:posterWidth ) ,
            posterImageView.heightAnchor.constraint(equalToConstant: posterWidth * 1.5)
        
        ])
        
        
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    
   
}

