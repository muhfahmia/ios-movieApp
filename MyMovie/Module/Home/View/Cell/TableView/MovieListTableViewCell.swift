//
//  MovieListTableViewCell.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit

class MovieListTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let UIBounds = UIScreen.main.bounds
    var movieSelected: ((Int) -> Void)?
    var movieListCVHeight: CGFloat?
    
    var movies: ([MovieModel])? {
        didSet {
            reloadCV()
        }
    }
    
    lazy var movieListCV: UICollectionView = {
        let layout: UICollectionViewFlowLayout = ResponsiveGridLayout(cellHeightRatio: 1.6)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(nibWithCellClass: MovieCardCollectionViewCell.self)
        return cv
    }()
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.layoutIfNeeded()
        return movieListCV.calculateHeightContent(column: 2, heightRatio: 1.6, totalItem: 20, spacing: 14)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(movieListCV)
        movieListCV.dataSource = self
        movieListCV.delegate = self
        movieListCV.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, leftConstant: 12, rightConstant: 12)
    }
    
    func reloadCV() {
        movieListCV.reloadData()
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
            cell.setMovieCard(movie: movie)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        movieSelected?(index)
    }
    
}
