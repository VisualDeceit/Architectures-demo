//
//  AppDetailScreenshotsController.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 26.04.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenshotsController: UIViewController {
    
    private var appDetailScreenshotsView: AppDetailScreenshotsView {
        return self.view as! AppDetailScreenshotsView
    }
    
    private let app: ITunesApp?
    
    let imageDownloader = ImageDownloader()
    let imageGroup = DispatchGroup()
    
    var screenshots: [UIImage] = []
    
    init(app: ITunesApp?) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailScreenshotsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDetailScreenshotsView.collectionView.dataSource = self
        self.appDetailScreenshotsView.collectionView.delegate = self
        
        getData()
    }
    
    private func getData() {
        app?.screenshotUrls.forEach({ (stringURL) in
            if let ulr = URL(string: stringURL) {
                imageGroup.enter()
                imageDownloader.getImage(fromUrl: ulr) { (image, _) in
                    self.screenshots.append(image!)
                    self.imageGroup.leave()
                }
            }
        })
        imageGroup.notify(queue: .main) {
            self.appDetailScreenshotsView.collectionView.reloadData()
        }
    }
}

extension AppDetailScreenshotsController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        screenshots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreeshotCell.reuseId, for: indexPath) as! ScreeshotCell
        cell.configure(screenshots[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 1.5, height: 400)
    }
}
