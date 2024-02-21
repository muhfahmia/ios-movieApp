//
//  MovieCardCollectionViewCell.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import UIKit

class MovieCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setMovieCard(movie: MovieModel) {
        movieTitle.text = movie.title
        movieImage.sd_setImage(with: URL(string: "\(ConstantsView.imgUrl+movie.posterPath)"))
    }

}
