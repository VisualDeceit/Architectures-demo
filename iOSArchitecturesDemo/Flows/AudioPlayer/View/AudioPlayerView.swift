//
//  AudioPlayerView.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import SwiftUI

class AudioPlayerView: UIView {
    
    private(set) lazy var artImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.secondarySystemFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    private(set) lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private(set) lazy var actualTrackTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var leftTrackTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var backwardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .label
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        return button
    }()
    
    private lazy var forwardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .label
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        return button
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .label
        button.setImage(UIImage(systemName: "play.fill"), for: .normal) //pause.fill
        return button
    }()
    
    private(set) lazy var trackProgressBar: UIProgressView = {
        let bar = UIProgressView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.trackTintColor = .red
        bar.progressTintColor = .blue
        return bar
    }()
    
    private lazy var buttonsStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [backwardButton, playButton, forwardButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    func setupView() {
        self.addSubview(artImageView)
        self.addSubview(artistLabel)
        self.addSubview(trackLabel)
        self.addSubview(actualTrackTimeLabel)
        self.addSubview(leftTrackTimeLabel)
        self.addSubview(buttonsStackView)
        self.addSubview(trackProgressBar)
        
        
        NSLayoutConstraint.activate([
            artImageView.heightAnchor.constraint(equalToConstant: 320),
            artImageView.widthAnchor.constraint(equalToConstant: 320),
            artImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            artImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            trackLabel.topAnchor.constraint(equalTo: artImageView.bottomAnchor, constant: 32),
            trackLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            artistLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 4),
            artistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            trackProgressBar.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 16),
            trackProgressBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            trackProgressBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            actualTrackTimeLabel.topAnchor.constraint(equalTo: trackProgressBar.bottomAnchor, constant: 4),
            actualTrackTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            leftTrackTimeLabel.topAnchor.constraint(equalTo: trackProgressBar.bottomAnchor, constant: 4),
            leftTrackTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor, multiplier: 1),
            forwardButton.widthAnchor.constraint(equalTo: forwardButton.heightAnchor, multiplier: 1),
            backwardButton.widthAnchor.constraint(equalTo: backwardButton.heightAnchor, multiplier: 1),

            buttonsStackView.topAnchor.constraint(equalTo: leftTrackTimeLabel.bottomAnchor, constant: 32),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        self.artImageView.layer.cornerRadius = 12
    }
}

struct AudioPlayerView_Preview: PreviewProvider {
    static var previews: some View {
        let view = AudioPlayerView()
        view.trackLabel.text = "Astronaut In The Ocean"
        view.artistLabel.text = "Masked Wolf"
        view.actualTrackTimeLabel.text = "0:03"
        view.leftTrackTimeLabel.text = "-1:35"
        return UIViewPreview(view)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height ))
    }
}
