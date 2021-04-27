//
//  AppDetailScreenshotsView.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 26.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenshotsView: UIView {
    
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .red//.systemBackground
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ScreenshotCell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            self.collectionView.heightAnchor.constraint(equalTo: self.collectionView.widthAnchor, multiplier: 0.75)
            self.collectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
