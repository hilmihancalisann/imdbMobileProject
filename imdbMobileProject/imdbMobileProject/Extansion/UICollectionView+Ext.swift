//
//  UICollectionView+Ext.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 1.01.2023.
//


import UIKit

extension UICollectionView {
    
    func reloadOnMinThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
