//
//  AuthAssembler.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import UIKit

protocol AuthAssembler {
    func resolve() -> AuthViewController
}

extension AuthAssembler where Self: Assembler {
    func resolve() -> AuthViewController {
        AuthViewController()
    }
}
