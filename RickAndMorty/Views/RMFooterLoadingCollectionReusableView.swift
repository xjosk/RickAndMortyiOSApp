//
//  RMFooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 20/05/24.
//

import UIKit

class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    static let identifier = "RMFooterLoadingCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
