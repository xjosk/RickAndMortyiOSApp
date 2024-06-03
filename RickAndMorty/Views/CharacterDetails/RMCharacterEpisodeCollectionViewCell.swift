//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Andrei E. Carvajal Brito on 25/05/24.
//

import UIKit

class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterEpisodeCollectionViewCell"
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        
        contentView.addSubviews(
            spinner, 
            episodeLabel,
            nameLabel,
            airDateLabel
        )
        setUpConstraints()
        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 30),
            spinner.widthAnchor.constraint(equalToConstant: 30),
            spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            episodeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            episodeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            episodeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            episodeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
            
            nameLabel.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        episodeLabel.text = nil
        nameLabel.text = nil
        airDateLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {
        viewModel.registerForData { [weak self] data in
            self?.spinner.stopAnimating()
            self?.episodeLabel.text = data.episode
            self?.nameLabel.text = "Episode "+data.name
            self?.airDateLabel.text = "Aired on "+data.air_date
        }
        viewModel.fetchEpisode()
    }
}
