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
    func configureDTitleLabel()
    func configureDateLabel()
    func configureOverwievLabel()
    
}



class DetailScrenVC: UIViewController {

    
    private let movie: MovieResults
    
    private let viewModel = DetailScrenVM()
    
    private let padding: CGFloat = 16
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overwievabel: UILabel!
    
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
    
    func configureDTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie._releaseDate
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel
        
        
        NSLayoutConstraint.activate([
        
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3 * padding),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        
        ])
    }
    
    func configureOverwievLabel() {
        overwievabel = UILabel(frame: .zero)
        view.addSubview(overwievabel)
        
        overwievabel.translatesAutoresizingMaskIntoConstraints = false
        
        overwievabel.text = movie._overwiew
        overwievabel.font = .systemFont(ofSize: 20)
        overwievabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
        
            overwievabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 2 * padding),
            overwievabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            overwievabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
}

