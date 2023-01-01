//
//  PosterImageView.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 30.12.2022.
//

import UIKit

class PosterImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        posterImgaeView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dowloadImage() {
        
    }
}
