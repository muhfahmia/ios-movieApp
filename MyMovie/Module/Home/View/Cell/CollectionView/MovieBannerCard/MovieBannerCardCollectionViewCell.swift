//
//  MovieCardCollectionViewCell.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import UIKit
import SDWebImage

class MovieBannerCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backdropPath: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setMovieData(movie: MovieModel) {
        title.text = movie.title
        backdropPath.sd_setImage(with: URL(string: "\(ConstantsView.imgUrl+movie.backdropPath)"))
    }
    
}
