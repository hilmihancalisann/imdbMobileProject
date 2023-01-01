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
    func reoladedCollectionView()
    func navigateDetailScree(movie: MovieResults)
    
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
    
    
    func navigateDetailScree(movie: MovieResults) {

        DispatchQueue.main.async {
            let detailScreen = DetailScrenVC(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)

            
        }
    }
    
   
    
    func configureVC() {
        
        view.backgroundColor = .systemGreen
        title = "Popular Movies"
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
    
    
    func reoladedCollectionView() {
        
        collectionView.reloadOnMinThread()
    }
    
   
    
}



extension HomeScrenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item]._id)    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let ofsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
       /* print("ofsetY: \(ofsetY)")
        print("contentHeight: \(contentHeight)")
        print("height: \(height)")*/
        
        if ofsetY >= contentHeight - (2 * height) {
            viewModel.getMovies()
        }
        
    }
}
