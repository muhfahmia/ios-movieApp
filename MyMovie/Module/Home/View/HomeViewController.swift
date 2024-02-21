//
//  HomeViewController.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    enum TableViewSection: Int, CaseIterable {
        case trendingTitle
        case trendingCV
        case nowPlayingTitle
    }
    
    @IBOutlet weak var homeTblView: UITableView!
    
    private let viewModel: HomeViewModel
    private let router: HomeRouter
    
    init(vm: HomeViewModel, route: HomeRouter) {
        viewModel = vm
        router = route
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        setupView()
    }
    
    private func setupView() {
        homeTblView.dataSource = self
        homeTblView.register(cellWithClass: MovieTrendingTableViewCell.self)
        homeTblView.register(cellWithClass: TitleSectionTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TableViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableViewSection(rawValue: indexPath.row)
        if section == .trendingTitle {
            let cell: TitleSectionTableViewCell = tableView.dequeueReusableCell(withClass: TitleSectionTableViewCell.self)
            cell.titleLabel.text = "Trending"
            return cell
        } else if section == .trendingCV {
            let cell: MovieTrendingTableViewCell = tableView.dequeueReusableCell(withClass: MovieTrendingTableViewCell.self)
            cell.movieSelected = { [weak self] index in
                
                guard let self = self else { return }
                
                let movieID = String(self.viewModel.movieTrending[index].movieID)
                self.router.routeToDetail(movieID: movieID, vc: self)
            }
            viewModel.getMovieList(param: viewModel.movieTrendingParam) { movies in
                    cell.movies = movies
                }
            return cell
        } else if section == .nowPlayingTitle {
            let cell: TitleSectionTableViewCell = tableView.dequeueReusableCell(withClass: TitleSectionTableViewCell.self)
            cell.titleLabel.text = "Now Playing"
            return cell
        }
        return UITableViewCell()
    }
    
}
