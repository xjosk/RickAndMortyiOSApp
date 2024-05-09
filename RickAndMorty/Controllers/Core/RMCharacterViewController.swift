//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 09/05/24.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive"),
            ]
        )
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self, completion: { result in
             
        })
    }
}
