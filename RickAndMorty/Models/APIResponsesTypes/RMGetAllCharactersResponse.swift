//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 16/05/24.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
