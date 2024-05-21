//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 16/05/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
