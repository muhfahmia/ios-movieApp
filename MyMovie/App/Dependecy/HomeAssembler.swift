//
//  HomeAssembler.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

protocol HomeAssembler {
    func resolve() -> HomeViewController
}

extension HomeAssembler where Self: Assembler {
    func resolve() -> HomeViewController {
        HomeViewController()
    }
}
