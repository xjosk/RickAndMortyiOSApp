//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 25/05/24.
//

import Foundation

protocol RMEpisodeDataRender {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class RMCharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    private var isFetching = false
    private var dataBlock: ((RMEpisodeDataRender) -> Void)?
    
    private var episode: RMEpisode? {
        didSet {
            guard let model = episode else {
                return
            }
            dataBlock?(model)
        }
    }
    
    // MARK: - Init
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
    
    // MARK: - Public
    
    public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        
        guard let url = episodeDataUrl,
              let rmRequest = RMRequest(url: url) else {
            return
        }
        
        isFetching = true
        
        RMService.shared.execute(rmRequest, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
