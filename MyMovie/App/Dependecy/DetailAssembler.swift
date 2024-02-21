//
//  DetailAssembler.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

protocol DetailAssembler {
    func resolve(id: String) -> DetailViewController
    func resolve() -> DetailViewModel
    func resolve() -> DetailRouter
}

extension DetailAssembler where Self: Assembler {
    
    func resolve(id: String) -> DetailViewController {
        DetailViewController(vm: resolve(), id: id)
    }
    
    func resolve() -> DetailViewModel {
        DetailViewModel(movieUseCase: resolve())
    }
    
    func resolve() -> DetailRouter {
        DefaultDetailRouter(assembler: self)
    }
    
}
