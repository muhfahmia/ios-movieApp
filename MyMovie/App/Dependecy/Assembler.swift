//
//  Assembler.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

protocol Assembler: AuthAssembler {}

class AppAssembler: Assembler {
    static let shared = AppAssembler()
}
