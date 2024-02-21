//
//  MovieTrendingTableViewCell.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit

class MovieTrendingTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let UIBounds = UIScreen.main.bounds
    
    var movies: ([MovieModel])? {
        didSet {
            trendingCV.reloadData()
        }
    }
    
    var movieSelected: ((Int) -> Void)?
    
    lazy var trendingCV: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIBounds.width, height: UIBounds.height * 0.23)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.register(nibWithCellClass: MovieCardCollectionViewCell.self)
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIBounds.width, height: UIBounds.height * 0.23)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(trendingCV)
        trendingCV.dataSource = self
        trendingCV.delegate = self
        trendingCV.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor)
    }
    
    func reloadCV() {
        trendingCV.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCardCollectionViewCell = collectionView.dequeueReusableCell(withClass: MovieCardCollectionViewCell.self, for: indexPath)
        if let movies = movies {
            let movie = movies[indexPath.row]
            cell.setMovieData(movie: movie)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        movieSelected?(index)
    }
    
}
