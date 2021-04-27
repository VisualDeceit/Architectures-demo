//
//  ScreeshotCell.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 27.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class ScreeshotCell: UICollectionViewCell {
    
    static let reuseId = "ScreenshotCell"
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ image: UIImage) {
        imageView.image = image
    }
}
