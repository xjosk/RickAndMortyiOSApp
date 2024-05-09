//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 09/05/24.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
