//
//  UIHelper.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 20.12.2022.
//


import UIKit

enum UIHelper {
    
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layaout = UICollectionViewFlowLayout()
        
        
        let itemWidth = CGFloat.dWidth
        
        
        layaout.scrollDirection = .vertical
        layaout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layaout.minimumLineSpacing = 30            //(collectionview arası bosluk)
        
        return layaout
    }
}
