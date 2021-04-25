//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 4/22/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

class AppDetailHeaderViewController: UIViewController {
    
    private var appDetailHeaderView: AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    private let app: ITunesApp?
    
    private var imageDownloader = ImageDownloader()
    
    init(app: ITunesApp?) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailHeaderView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }
    
    // MARK: - Private
    
    private func getData() {
        self.appDetailHeaderView.titleLabel.text = app?.appName
        self.appDetailHeaderView.descriptionLabel.text = app?.company
        self.downloadImage()
    }
    
    private func downloadImage() {
        guard let iconURL = self.app?.iconUrl else { return }
        self.imageDownloader.getImage(fromUrl: iconURL) { image, _ in
            self.appDetailHeaderView.imageView.image = image
        }
    }

    
}
