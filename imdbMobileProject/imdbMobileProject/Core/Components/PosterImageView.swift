//
//  PosterImageView.swift
//  imdbMobileProject
//
//  Created by Hilmihan Çalışan on 30.12.2022.
//

import UIKit

final class PosterImageView: UIImageView {

   private var dataTask: URLSessionDataTask?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dowloadImage(movie: MovieResults) {
        
       guard let url = URL(string: APIURLs.imageUrl(posterPath: movie._posterPath))  else {return}
        
        dataTask = NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case.success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case.failure(_):
                break
            }
       
        }
        
        
        dataTask?.resume()
    }
    
    func cancelDowloading() {
        dataTask?.cancel()
        dataTask = nil
    }
}
