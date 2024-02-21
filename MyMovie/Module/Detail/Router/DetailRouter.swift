//
//  DetailRouter.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit

protocol DetailRouter {
    func routeToDetail(movieID: String, vc: UIViewController)
}

class DefaultDetailRouter: DetailRouter {
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func routeToDetail(movieID: String, vc: UIViewController) {
        let detailVC: DetailViewController = assembler.resolve(id: movieID)
        vc.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
