//
//  DetailViewController.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit
import SVProgressHUD

class DetailViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var adultLbl: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    
    var movieID: String
    
    var viewModel: DetailViewModel
    
    init(vm: DetailViewModel, id: String) {
        movieID = id
        viewModel = vm
        viewModel.movieParam.movieID = id
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        progressView(flag: true)
        contentView.isHidden = true
        viewModel.getMovieDetail(param: viewModel.movieParam) { [weak self] _ in
            guard let self = self else { return }
            self.setViewData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressView(flag: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewData() {
        backdropImage.sd_setImage(with: URL(string: "\(ConstantsView.imgUrl+viewModel.movie.backdropPath)"))
        movieImage.sd_setImage(with: URL(string: "\(ConstantsView.imgUrl+viewModel.movie.posterPath)"))
        releaseDateLbl.text = viewModel.movie.releaseDate
        adultLbl.text = "\(viewModel.movie.adult)"
        movieTitleLbl.text = viewModel.movie.title
        synopsis.text = viewModel.movie.description
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [weak self] in
            guard let self = self else { return }
            progressView(flag: false)
            contentView.isHidden = false
        }
    }
    
    private func progressView(flag: Bool) {
        DispatchQueue.main.async {
            if flag == true {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }
    }
}
