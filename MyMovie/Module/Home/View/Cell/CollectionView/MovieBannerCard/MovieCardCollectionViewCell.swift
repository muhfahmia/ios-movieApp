//
//  MovieCardCollectionViewCell.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import UIKit
import SDWebImage

class MovieCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backdropPath: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setMovieData(movie: MovieModel) {
        backdropPath.sd_setImage(with: URL(string: "\(ConstantsView.imgUrl+movie.backdropPath)")) { [weak self] (image, error, cacheType, imageURL) in
            self?.title.text = movie.title
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
            }
        }
    }
    
}
