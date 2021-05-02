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
    
    //TODO: - Добавить плеер
    func openPlayer(for song: ITunesSong) {
        //let songPlayerViewController = SongPlayerViewController()
        //songPlayerViewController.song = song
        //self.viewController?.navigationController?.pushViewController(songPlayerViewController, animated: true)
    }
    
    weak var viewController: UIViewController?
}
