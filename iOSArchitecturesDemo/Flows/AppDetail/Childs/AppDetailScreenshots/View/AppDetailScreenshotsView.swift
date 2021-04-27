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
        return cv
    }()
    
    var collectionViewHeight: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(collectionView)
                
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(ScreeshotCell.self, forCellWithReuseIdentifier: ScreeshotCell.reuseId)
        
        collectionViewHeight = self.collectionView.heightAnchor.constraint(equalToConstant: 300)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionViewHeight
        ])
    }
}
