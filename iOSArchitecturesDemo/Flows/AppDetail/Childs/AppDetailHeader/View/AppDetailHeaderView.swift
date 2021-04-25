//
//  AppDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 4/22/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class AppDetailHeaderView: UIView {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.secondarySystemFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()
    
    private(set) lazy var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        return button
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
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(openButton)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 68),
            imageView.widthAnchor.constraint(equalToConstant: 68),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -4),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: openButton.topAnchor, constant: 16),
            
            
            openButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            openButton.widthAnchor.constraint(equalToConstant: 80),
            openButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            openButton.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.openButton.layer.cornerRadius = self.openButton.bounds.height / 2
    }
    
}

struct AppDetailHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        let view = AppDetailHeaderView()
        view.titleLabel.text = "Sharp 3D CAD modeling"
        view.descriptionLabel.text = "Design models"
        return UIViewPreview(view)
            .previewLayout(.fixed(width: 375, height: 130))
    }
}
