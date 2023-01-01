//
//  UIView+Extansion.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 20.12.2022.
//


import UIKit


extension UIView {
    
    func pinToEdgesOf(view: UIView) {
        NSLayoutConstraint.activate([
        
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
           trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
}
