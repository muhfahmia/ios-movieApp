//
//  HomeRouter.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import UIKit

protocol HomeRouter {
    func routeToDetail(movieID: String, vc: UIViewController)
}

class DefaultHomeRouter: HomeRouter {
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func routeToDetail(movieID: String, vc: UIViewController) {
        let detailRouter: DetailRouter = assembler.resolve()
        detailRouter.routeToDetail(movieID: movieID, vc: vc)
    }
    
}
