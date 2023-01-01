//
//  MovieCell.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 20.12.2022.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    private var posterImgaeView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       configureCell()
        configurePosterImageVew()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureCell() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 20      //(collectionviiewcell köşe ovalliği)
        clipsToBounds = true
    }
    
    
    private func configurePosterImageVew() {
        
        posterImgaeView = PosterImageView(frame: .zero)
        addSubview(posterImgaeView)
        
       
        
        
        posterImgaeView.pinToEdgesOf(view: self)
    }
    
}
