//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 10/06/23.
//

import Foundation

/// Represents unique API points
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
