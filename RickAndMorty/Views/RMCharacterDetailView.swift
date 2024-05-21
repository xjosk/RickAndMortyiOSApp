//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 20/05/24.
//

import UIKit

final class RMCharacterDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

}
