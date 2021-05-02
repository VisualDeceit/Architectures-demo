//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongRouterInput {
    func openPlayer(for songModel: SongCellModel)
}

final class SearchSongRouter: SearchSongRouterInput {
    
    weak var viewController: UIViewController?
    
    func openPlayer(for songModel: SongCellModel) {
        let audioPlayerViewController = AudioPlayerAssembly.build() as! AudioPlayerViewController
        audioPlayerViewController.songModel = songModel
        self.viewController?.present(audioPlayerViewController, animated: true)
    }
}
