//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Fomin on 02.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongRouterInput {
    func openPlayer(for song: ITunesSong)
}

final class SearchSongRouter: SearchSongRouterInput {
    
    weak var viewController: UIViewController?
    
    func openPlayer(for song: ITunesSong) {
        let audioPlayerViewController = AudioPlayerViewController()
        audioPlayerViewController.song = song
        self.viewController?.present(audioPlayerViewController, animated: true)
    }
}
