//
//  HomeScrenVC.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 18.12.2022.
//

import UIKit


protocol HomeScreenInterface: AnyObject {
    
    func configureVC()
    func configureCollectionView()
    
}


final class HomeScrenVC: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidload()
        
    }
    

   
   

}


extension HomeScrenVC: HomeScreenInterface {
   
    
    func configureVC() {
        
        view.backgroundColor = .systemBackground
    }
    
    
    
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
        collectionView.pinToEdgesOf(view: view)
        
        
    }
    
    
    
    
   
    
}



extension HomeScrenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        
        return cell
    }
    

    
    
}
